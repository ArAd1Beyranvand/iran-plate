import 'package:plate_core/plate_core.dart';

part 'iran_regions_data.dart';

class _Row {
  const _Row(this.code, this.letters, this.city, this.province);

  final String code;
  final String letters;
  final String city;
  final String province;
}

/// Where a plate was issued: the city when the code and series letter pin it
/// down, otherwise the province.
class IranRegion {
  const IranRegion({required this.province, this.city});

  final String province;

  /// Null when only the province is certain.
  final String? city;

  String get caption => city ?? province;
}

/// Locates an Iranian plate from its two-digit province code and series letter.
abstract final class IranRegions {
  static const String _persian = '۰۱۲۳۴۵۶۷۸۹';

  static String _latinDigits(String s) => s.splitMapJoin(
    RegExp('[۰-۹]'),
    onMatch: (m) => '${_persian.indexOf(m[0]!)}',
    onNonMatch: (s) => s,
  );

  /// The region of [code] (two digits, Persian or Latin) and [letter], or null
  /// while [code] is incomplete, unissued, or shared by several provinces that
  /// [letter] does not tell apart (30, 21, 38, 78, 32, 42).
  static IranRegion? lookup(String code, [String? letter]) {
    code = _latinDigits(code);
    if (code.length != 2) return null;
    final rows = _rows.where((r) => r.code == code).toList();
    if (rows.isEmpty) return null;
    if (letter != null && letter.isNotEmpty) {
      for (final wildcard in [false, true]) {
        for (final r in rows) {
          if (wildcard ? r.letters == '*' : r.letters.contains(letter)) {
            return IranRegion(province: r.province, city: r.city);
          }
        }
      }
    }
    final provinces = {for (final r in rows) r.province};
    return provinces.length == 1 ? IranRegion(province: provinces.first) : null;
  }

  /// A [PlateLabelResolver] for the province square: the region's caption, or
  /// null (the label's own text) while it cannot be told.
  static String? captionOf(String Function(String key) group) =>
      lookup(group('province'), group('letter'))?.caption;
}
