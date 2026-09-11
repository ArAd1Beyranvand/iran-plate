import 'package:core_plate/core_plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

/// One golden for `IranPlates.car`, filled in full — RTL layout, the Persian
/// digit glyph mapping, the `ایران` label, and the province flag SVG. Modelled
/// on `palestine_plate/test/golden_test.dart`; see that file for the render
/// harness this one shares the shape of.
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  testWidgets('car, full value (RTL, glyph mapping, province rule)', (tester) async {
    final spec = IranPlates.car;
    final controller = PlateController.fromValues(spec, const ['1', '2', 'ب', '3', '4', '5', '6', '7']);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SizedBox(
              width: 520,
              height: 520 * spec.canvasHeight / spec.canvasWidth,
              child: PlateView(controller: controller),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/ir_car.png'));

    await tester.pumpWidget(const SizedBox.shrink());
    controller.dispose();
  });
}
