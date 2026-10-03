import 'package:core_plate/core_plate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

void main() {
  final specs = IranPlates.all;

  test('every keyed register is evenly pitched', () {
    for (final spec in specs) {
      var ok = false;
      assert(ok = debugValidateSpec(spec));
      expect(ok, isTrue, reason: spec.id);
    }
  });

  test('spec ids are unique', () {
    expect(specs.map((s) => s.id).toSet(), hasLength(specs.length));
  });

  test('every usage resolves to a spec and a theme', () {
    for (final usage in IranUsage.values) {
      expect(IranPlates.forUsage(usage), isNotNull, reason: usage.name);
      expect(IranThemes.forUsage(usage), isNotNull, reason: usage.name);
    }
  });

  test('the standard blank is the same geometry in every class', () {
    // The whole point of `_standard`: a taxi is a private plate in yellow with
    // a different letter, not a second design. If a class ever drifts off the
    // shared blank this is what says so.
    const standard = <IranUsage>[
      IranUsage.private,
      IranUsage.taxi,
      IranUsage.publicTransport,
      IranUsage.agricultural,
      IranUsage.government,
      IranUsage.disabled,
      IranUsage.temporary,
      IranUsage.police,
      IranUsage.irgc,
      IranUsage.army,
      IranUsage.ministryOfDefence,
      IranUsage.generalStaff,
      IranUsage.political,
      IranUsage.service,
    ];
    for (final usage in standard) {
      final spec = IranPlates.forUsage(usage);
      expect(spec.slotCount, 8, reason: usage.name);
      expect(spec.canvasWidth, 520, reason: usage.name);
      expect(spec.canvasHeight, 110, reason: usage.name);
      // Slot 2 is the series letter; every other slot is a Persian digit.
      for (var i = 0; i < spec.slotCount; i++) {
        if (i == 2) continue;
        expect(
          spec.slots[i].alphabet,
          PersianAlphabets.digits,
          reason: '${usage.name} slot $i',
        );
      }
    }
  });

  test(
    'a non-private class fixes its series letter to exactly one character',
    () {
      for (final usage in IranUsage.values) {
        final letter = usage.seriesLetter;
        if (letter == null) continue;
        final alphabet = PersianAlphabets.forUsage(usage);
        expect(alphabet, isNotNull, reason: usage.name);
        expect(alphabet!.characters, [letter], reason: usage.name);
        // Never typed: a fixed letter is not the user's to clear. See the note in
        // PersianAlphabets.
        expect(alphabet.input, AlphabetInput.chosen, reason: usage.name);
      }
    },
  );

  test('the disabled plate stores ژ and prints ♿︎', () {
    // The article's footnote: the wheelchair symbol is what is printed, `ژ` is
    // what the police database holds. Storage and display, not two characters.
    const alphabet = PersianAlphabets.disabledSymbol;
    expect(alphabet.render('ژ'), '♿︎');
    expect(alphabet.canonical('♿︎'), 'ژ');
    expect(alphabet.accepts('♿︎'), isTrue);
    expect(IranUsage.disabled.seriesLetter, 'ژ');
  });

  test(
    'the private series is the thirteen county letters and nothing else',
    () {
      // Every letter reserved to another class must be absent, or the picker
      // would offer a private plate that cannot legally exist.
      const reserved = <String>[
        'ت',
        'ع',
        'ک',
        'الف',
        'پ',
        'ث',
        'ش',
        'ز',
        'ف',
        'گ',
        'ژ',
      ];
      expect(PersianAlphabets.privateLetters.characters, hasLength(13));
      for (final letter in reserved) {
        expect(
          PersianAlphabets.privateLetters.characters,
          isNot(contains(letter)),
          reason: letter,
        );
      }
    },
  );

  test('alphabet ids are unique per character set across the package', () {
    final byId = <String, List<String>>{};
    for (final spec in specs) {
      for (final slot in spec.slots) {
        final seen = byId[slot.alphabet.id];
        if (seen != null) {
          expect(seen, slot.alphabet.characters, reason: slot.alphabet.id);
        }
        byId[slot.alphabet.id] = slot.alphabet.characters;
      }
    }
  });
}
