import 'package:core_plate/core_plate.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

void main() {
  final specs = <PlateSpec>[IranPlates.car, IranPlates.bicycle];

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
}
