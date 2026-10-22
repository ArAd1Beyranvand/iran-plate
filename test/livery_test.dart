import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';
import 'package:plate_core/plate_core.dart';

void main() {
  test('the civil theme follows the series letter', () {
    final base = IranThemes.blackOnWhite;
    PlateTheme of(String letter) => IranThemes.civil(base, (key) => key == 'letter' ? letter : '');
    expect(of('ب').plateBackground, IranColors.white);
    expect(of('ت').plateBackground, IranColors.yellow);
    expect(of('الف').ink, IranColors.white);
    expect(of('D').plateBackground, IranColors.politicalCyan);
    expect(of('').plateBackground, IranColors.white);
  });

  test('every letter of every usage is on the civil keypad', () {
    for (final usage in IranUsage.values) {
      final letter = usage.seriesLetter;
      if (letter == null || IranPlates.forUsage(usage) != IranPlates.civil) {
        continue;
      }
      expect(PersianAlphabets.civilLetters.accepts(letter), isTrue);
    }
  });

  testWidgets('choosing ت fades the field to yellow and shows TAXI', (tester) async {
    final c = PlateController.fromValues(IranPlates.civil, const [
      '12', 'ب', '345', '11', //
    ]);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: PlateView(controller: c)),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('TAXI'), findsNothing);
    c.setAt(1, 'ت');
    await tester.pumpAndSettle();
    expect(find.text('TAXI'), findsOneWidget);
    c.setAt(1, 'ب');
    await tester.pumpAndSettle();
    expect(find.text('TAXI'), findsNothing);
    await tester.pumpWidget(const SizedBox.shrink());
    c.dispose();
  });
}
