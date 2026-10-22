import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per Iranian spec, filled in full. The test runner draws every
/// glyph as a box, so these pin geometry, layering and the field runs, not
/// letterforms.
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  final cases = <String, (PlateSpec, IranUsage, List<String?>)>{
    'ir_car': (IranPlates.civil, IranUsage.private, ['12', 'ب', '345', '67']),
    'ir_protocol': (IranPlates.protocol, IranUsage.protocol, ['13901']),
    'ir_historic': (IranPlates.historic, IranUsage.historic, ['12365']),
    'ir_motorcycle': (IranPlates.motorcycle, IranUsage.motorcycle, ['123', '56789']),
  };

  for (final entry in cases.entries) {
    testWidgets('${entry.key}, full value', (tester) async {
      final (spec, usage, values) = entry.value;
      final controller = PlateController.fromValues(spec, values);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 520,
                height: 520 * spec.canvasHeight / spec.canvasWidth,
                child: PlateView(controller: controller, theme: IranThemes.forUsage(usage)),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      // A decal decodes off the test clock; give it real time, then repaint.
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 300)));
      await tester.pump();

      await expectLater(find.byType(PlateView), matchesGoldenFile('goldens/${entry.key}.png'));

      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
