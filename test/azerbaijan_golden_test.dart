import 'package:core_plate/core_plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

/// One golden per Azerbaijani design, each filled in full. Modelled on
/// `bahrain_golden_test.dart`, which does the same for Bahrain's five.
///
/// Five cases over four specs: `az.car` appears twice, once in the civilian
/// white and once in the transport blue, because the blue bus-and-taxi plate is
/// that spec under another theme rather than a spec of its own. That is exactly
/// the claim worth having a picture of — so the file names are keyed on the
/// theme as well as the spec.
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  for (final (name, spec, theme, value) in <(String, PlateSpec, PlateTheme, List<String>)>[
    ('az_car', AzerbaijanPlates.car, AzerbaijanThemes.civilian, ['8', '8', 'B', 'E', '1', '1', '4']),
    ('az_car_transport', AzerbaijanPlates.car, AzerbaijanThemes.transport, ['1', '0', 'T', 'H', '3', '0', '8']),
    ('az_bicycle', AzerbaijanPlates.bicycle, AzerbaijanThemes.civilian, ['0', '7', 'T', '0', '9', '6']),
    ('az_diplomatic', AzerbaijanPlates.diplomatic, AzerbaijanThemes.diplomatic, ['0', '1', '3', 'D', '0', '0', '4']),
    ('az_foreign', AzerbaijanPlates.foreign, AzerbaijanThemes.foreign, ['H', '0', '2', '3', '1', '4', '9']),
  ]) {
    testWidgets('$name, full value', (tester) async {
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

      await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/$name.png'));

      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
