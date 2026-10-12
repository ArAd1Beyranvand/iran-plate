import 'package:flutter_test/flutter_test.dart';
import 'package:iran_plate/iran_plate.dart';

void main() {
  test('code plus letter pins the city', () {
    expect(IranRegions.lookup('۱۵', 'ب')?.caption, 'تبریز');
    expect(IranRegions.lookup('25', 'ب')?.caption, 'مراغه');
    expect(IranRegions.lookup('۱۴', 'ی')?.city, 'اهواز');
  });

  test('falls back to the province, or to nothing when ambiguous', () {
    expect(IranRegions.lookup('48')?.province, 'بوشهر');
    expect(IranRegions.lookup('32'), isNull);
    expect(IranRegions.lookup('9'), isNull);
    expect(IranRegions.lookup('00'), isNull);
  });
}
