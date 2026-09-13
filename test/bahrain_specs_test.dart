import 'package:core_plate/core_plate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

/// What the five Bahraini specs claim about themselves, checked as data. No
/// widget is built here — see `bahrain_golden_test.dart` for what they look
/// like.
void main() {
  group('every Bahraini spec', () {
    test('is internally consistent', () {
      for (final spec in BahrainPlates.all) {
        expect(debugValidateSpec(spec), isTrue, reason: spec.id);
      }
    });

    test('has a unique id', () {
      final ids = BahrainPlates.all.map((s) => s.id).toSet();
      expect(ids, hasLength(BahrainPlates.all.length));
      expect(ids.every((id) => id.startsWith('bh.')), isTrue);
    });

    test('names its serial, so a spec swap keeps the digits already entered', () {
      for (final spec in BahrainPlates.all) {
        expect(spec.indicesOfGroup('serial'), hasLength(spec.slotCount), reason: spec.id);
      }
    });

    test('is all Latin digits — Bahraini serials carry no letters', () {
      for (final spec in BahrainPlates.all) {
        for (final slot in spec.slots) {
          expect(slot.alphabet, PlateAlphabet.latinDigits, reason: spec.id);
        }
      }
    });

    test('carries exactly one security band', () {
      for (final spec in BahrainPlates.all) {
        expect(spec.rules, hasLength(1), reason: spec.id);
      }
    });

    test('sets its wording as labels, never as a panel caption', () {
      for (final spec in BahrainPlates.all) {
        expect(spec.country.captionLines, isEmpty, reason: spec.id);
        expect(spec.labels, isNotEmpty, reason: spec.id);
      }
    });
  });

  test('serial lengths are 6 / 6 / 4 / 3 / 4', () {
    expect(BahrainPlates.all.map((s) => s.slotCount), [6, 6, 4, 3, 4]);
  });

  group('the security band', () {
    test('stands clear of the right frame on the two civilian sizes', () {
      for (final spec in [BahrainPlates.eu, BahrainPlates.us]) {
        expect(spec.rules.single.box.right, lessThan(spec.canvasWidth), reason: spec.id);
      }
    });

    test('runs full height hard against the right edge on the other three', () {
      for (final spec in [BahrainPlates.bicycle, BahrainPlates.diplomatic, BahrainPlates.police]) {
        final band = spec.rules.single.box;
        expect(band.right, spec.canvasWidth, reason: spec.id);
        expect(band.top, 0, reason: spec.id);
        expect(band.bottom, spec.canvasHeight, reason: spec.id);
      }
    });

    test('is clear of every slot', () {
      for (final spec in BahrainPlates.all) {
        final band = spec.rules.single.box;
        for (final slot in spec.slots) {
          expect(slot.box.right, lessThanOrEqualTo(band.left), reason: spec.id);
        }
      }
    });
  });

  group('the panel', () {
    test('holds the flag on civilian plates, in the field colour', () {
      for (final spec in [BahrainPlates.eu, BahrainPlates.us, BahrainPlates.bicycle]) {
        expect(spec.country.flag, isNotNull, reason: spec.id);
        expect(spec.country.panelColor, BahrainColors.field, reason: spec.id);
        // The box IS the flag: zero padding, full scale, 3:5.
        expect(spec.panel.padding, EdgeInsets.zero, reason: spec.id);
        expect(spec.panel.flagScale, 1.0, reason: spec.id);
        expect(spec.panel.box.width / spec.panel.box.height, closeTo(5 / 3, 0.001), reason: spec.id);
      }
    });

    test('is a bare colour band on the special plates', () {
      for (final spec in [BahrainPlates.diplomatic, BahrainPlates.police]) {
        expect(spec.country.flag, isNull, reason: spec.id);
        expect(spec.panel.flagScale, 0, reason: spec.id);
        // Spans from the left edge to the security band.
        expect(spec.panel.box.left, 0, reason: spec.id);
        expect(spec.panel.box.right, spec.rules.single.box.left, reason: spec.id);
      }
    });
  });

  test('labels on a colour band name their own ink; labels on the field do not', () {
    for (final spec in [BahrainPlates.eu, BahrainPlates.us, BahrainPlates.bicycle]) {
      expect(spec.labels.every((l) => l.color == null), isTrue, reason: spec.id);
    }
    expect(BahrainPlates.diplomatic.labels.every((l) => l.color == BahrainColors.onDiplomaticGreen), isTrue);
    expect(BahrainPlates.police.labels.every((l) => l.color == BahrainColors.onPoliceBlue), isTrue);
  });

  test('no Bahraini theme paints its band in its ink', () {
    for (final theme in [BahrainThemes.civilian, BahrainThemes.diplomatic, BahrainThemes.police]) {
      expect(theme.dividerColor, BahrainColors.band);
      expect(theme.dividerColor, isNot(theme.ink));
    }
  });
}
