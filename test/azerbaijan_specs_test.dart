import 'package:core_plate/core_plate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

/// What the four Azerbaijani specs claim about themselves, checked as data. No
/// widget is built here — see `azerbaijan_golden_test.dart` for what they look
/// like.
void main() {
  group('every Azerbaijani spec', () {
    test('is internally consistent', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(debugValidateSpec(spec), isTrue, reason: spec.id);
      }
    });

    test('has a unique id', () {
      final ids = AzerbaijanPlates.all.map((s) => s.id).toSet();
      expect(ids, hasLength(AzerbaijanPlates.all.length));
      expect(ids.every((id) => id.startsWith('az.')), isTrue);
    });

    test('carries seven characters — six on the motorcycle, which drops a letter', () {
      expect(AzerbaijanPlates.all.map((s) => s.slotCount), [7, 6, 7, 7]);
    });

    test('names its serial, so a spec swap keeps the digits already entered', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(spec.indicesOfGroup('serial'), hasLength(3), reason: spec.id);
      }
    });

    test('is read left to right', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(spec.textDirection, TextDirection.ltr, reason: spec.id);
      }
    });

    test('is Latin digits and Latin uppercase, nothing else', () {
      for (final spec in AzerbaijanPlates.all) {
        for (final slot in spec.slots) {
          expect(
            slot.alphabet,
            anyOf(PlateAlphabet.latinDigits, PlateAlphabet.latinUppercase),
            reason: spec.id,
          );
        }
      }
    });

    test('prints no divider and no security band', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(spec.rules, isEmpty, reason: spec.id);
      }
    });

    test('prints no decal', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(spec.decals, isEmpty, reason: spec.id);
      }
    });
  });

  group('the country block', () {
    test('is the same value on every class, coloured field or not', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(identical(spec.country, AzerbaijanCountry.azerbaijan), isTrue, reason: spec.id);
      }
    });

    test('sets AZ as a caption, never as a label', () {
      expect(AzerbaijanCountry.azerbaijan.captionLines, <String>['AZ']);
      for (final spec in AzerbaijanPlates.all) {
        for (final label in spec.labels) {
          expect(label.text, isNot('AZ'), reason: spec.id);
        }
      }
    });

    test('is a white block with dark wording, so it reads on any field', () {
      expect(AzerbaijanCountry.azerbaijan.panelColor, AzerbaijanColors.field);
      expect(AzerbaijanCountry.azerbaijan.panelTextColor, AzerbaijanColors.ink);
    });

    test('holds the flag at 1:2, filling the box width exactly', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(spec.country.flag, isNotNull, reason: spec.id);
        expect(spec.panel.padding, EdgeInsets.zero, reason: spec.id);
        expect(spec.panel.flagScale, 1.0, reason: spec.id);
        expect(spec.country.flagAspectRatio, 2, reason: spec.id);
      }
    });

    test('stays clear of the frame — a white block must not rub it out', () {
      for (final spec in AzerbaijanPlates.all) {
        final box = spec.panel.box;
        expect(box.left, greaterThan(0), reason: spec.id);
        expect(box.top, greaterThan(0), reason: spec.id);
        expect(box.bottom, lessThan(spec.canvasHeight), reason: spec.id);
      }
    });
  });

  group('the grouping of the serial is what makes a spec', () {
    test('car and motorcycle read region / letters / serial', () {
      for (final spec in [AzerbaijanPlates.car, AzerbaijanPlates.bicycle]) {
        expect(spec.effectiveTextGroups.map((g) => g.key), ['region', 'letters', 'serial'], reason: spec.id);
      }
    });

    test('but with two letters on the car and one on the motorcycle', () {
      expect(AzerbaijanPlates.car.indicesOfGroup('letters'), hasLength(2));
      expect(AzerbaijanPlates.bicycle.indicesOfGroup('letters'), hasLength(1));
    });

    test('the motorcycle lays its serial in a second row, under the region pair', () {
      final region = AzerbaijanPlates.bicycle.indicesOfGroup('region');
      final serial = AzerbaijanPlates.bicycle.indicesOfGroup('serial');
      final headBottom = AzerbaijanPlates.bicycle.slots[region.last].box.bottom;
      expect(AzerbaijanPlates.bicycle.slots[serial.first].box.top, greaterThan(headBottom));
    });

    test('the diplomatic plate reads mission / class / serial', () {
      expect(AzerbaijanPlates.diplomatic.effectiveTextGroups.map((g) => g.key), ['mission', 'class', 'serial']);
    });

    test('the foreign-company plate leads with its class letter', () {
      expect(AzerbaijanPlates.foreign.effectiveTextGroups.map((g) => g.key), ['class', 'series', 'serial']);
      expect(AzerbaijanPlates.foreign.slots.first.alphabet, PlateAlphabet.latinUppercase);
    });
  });

  group('the hyphens', () {
    test('are the only labels on the plate, and only the civilian plates have them', () {
      expect(AzerbaijanPlates.car.labels.map((l) => l.text), ['-', '-']);
      expect(AzerbaijanPlates.bicycle.labels.map((l) => l.text), ['-']);
      expect(AzerbaijanPlates.diplomatic.labels, isEmpty);
      expect(AzerbaijanPlates.foreign.labels, isEmpty);
    });

    test('take the theme ink, never an ink of their own', () {
      for (final spec in AzerbaijanPlates.all) {
        expect(spec.labels.every((l) => l.color == null), isTrue, reason: spec.id);
      }
    });

    test('sit in the gaps between groups, never over a slot', () {
      for (final spec in AzerbaijanPlates.all) {
        for (final label in spec.labels) {
          for (final slot in spec.slots) {
            final overlaps = label.box.left < slot.box.right && slot.box.left < label.box.right;
            expect(overlaps, isFalse, reason: '${spec.id}: "${label.text}" overlaps a slot');
          }
        }
      }
    });

    test('are centred on the glyph line of the row they punctuate', () {
      for (final (spec, row) in <(PlateSpec, int)>[
        (AzerbaijanPlates.car, 0),
        (AzerbaijanPlates.bicycle, 3),
      ]) {
        final box = spec.slots[row].box;
        // A slot centres its glyph in its box; a label is laid out from the top
        // of its own. The glyph's line height is glyphStyle's 0.72 of the
        // nominal height, so these two centres agree only at this top.
        final expectedTop = box.top + box.height / 2 - 0.72 * box.height / 2;
        for (final label in spec.labels) {
          expect(label.box.top, closeTo(expectedTop, 0.1), reason: spec.id);
          expect(label.glyphHeight, box.height, reason: spec.id);
        }
      }
    });
  });

  group('the themes', () {
    test('are one ink on one field — every one of them monochrome', () {
      for (final theme in [
        AzerbaijanThemes.civilian,
        AzerbaijanThemes.transport,
        AzerbaijanThemes.diplomatic,
        AzerbaijanThemes.foreign,
      ]) {
        expect(theme.plateBorder, theme.ink);
        expect(theme.dividerColor, theme.ink);
        expect(theme.activeColor, theme.ink);
      }
    });

    test('give every class its own field', () {
      final fields = [
        AzerbaijanThemes.civilian,
        AzerbaijanThemes.transport,
        AzerbaijanThemes.diplomatic,
        AzerbaijanThemes.foreign,
      ].map((t) => t.plateBackground).toSet();
      expect(fields, hasLength(4));
    });

    test('outline an empty field in something that reads on a dark plate', () {
      for (final theme in [AzerbaijanThemes.transport, AzerbaijanThemes.diplomatic]) {
        expect(theme.inactiveColor, AzerbaijanColors.inactiveOnDark);
      }
    });

    test('the blue transport plate is the car spec, not a spec of its own', () {
      expect(AzerbaijanPlates.all.map((s) => s.id), isNot(contains('az.transport')));
      expect(AzerbaijanThemes.transport.plateBackground, AzerbaijanColors.transportBlue);
    });
  });

  test('is a country of its own alongside Iran and Bahrain', () {
    for (final spec in AzerbaijanPlates.all) {
      expect(spec.country, isNot(IranCountry.iran), reason: spec.id);
      expect(spec.country, isNot(BahrainCountry.civilian), reason: spec.id);
    }
    final ids = <String>{
      for (final s in [...AzerbaijanPlates.all, ...BahrainPlates.all, IranPlates.car, IranPlates.bicycle]) s.id,
    };
    expect(ids, hasLength(AzerbaijanPlates.all.length + BahrainPlates.all.length + 2));
  });
}
