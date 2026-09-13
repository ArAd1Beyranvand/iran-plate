import 'package:core_plate/core_plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

/// One golden per Bahraini design, each filled in full. Modelled on
/// `golden_test.dart`, which does the same for `IranPlates.car`.
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  for (final (spec, theme, value) in <(PlateSpec, PlateTheme, List<String>)>[
    (BahrainPlates.eu, BahrainThemes.civilian, ['2', '4', '3', '7', '8', '3']),
    (BahrainPlates.us, BahrainThemes.civilian, ['2', '4', '3', '7', '8', '3']),
    (BahrainPlates.bicycle, BahrainThemes.civilian, ['7', '9', '2', '1']),
    (BahrainPlates.diplomatic, BahrainThemes.diplomatic, ['2', '4', '3']),
    (BahrainPlates.police, BahrainThemes.police, ['4', '7', '7', '8']),
  ]) {
    testWidgets('${spec.id}, full value', (tester) async {
      final controller = PlateController.fromValues(spec, value);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 520 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(controller: controller, theme: theme),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/${spec.id.replaceAll('.', '_')}.png'));

      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
