import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';

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
    'ir_motorcycle': (
      IranPlates.motorcycle,
      IranUsage.motorcycle,
      ['123', '56789'],
    ),
  };

  for (final entry in cases.entries) {
    testWidgets('${entry.key}, full value', (tester) async {
      final (spec, usage, values) = entry.value;
      final controller = PlateController.fromValues(spec, values);

      await pumpPlateGolden(
        tester,
        controller,
        'goldens/${entry.key}.png',
        theme: IranThemes.forUsage(usage),
        scoped: false,
        stage: Size(520, 520 * spec.canvasHeight / spec.canvasWidth),
        decodeDelay: const Duration(milliseconds: 300),
      );
    });
  }
}
