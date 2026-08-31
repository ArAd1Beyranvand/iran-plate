import 'package:flutter/widgets.dart';
import 'package:plate_number/plate_number.dart';

/// Iran's plate chrome.
class IranCountry {
  const IranCountry._();

  /// The Islamic Republic of Iran, as it appears on a standard plate: a blue
  /// panel with white "I.R." / "IRAN" text beside the flag.
  static const PlateCountry iran = PlateCountry(
    code: 'ir',
    captionLines: ['I.R.', 'IRAN'],
    panelColor: Color(0xFF16479D),
    panelTextColor: Color(0xFFFFFFFF),
    flagAspectRatio: 7 / 4,
    flag: SvgPlateAsset(
      'assets/flags/Flag_of_Iran.svg',
      package: 'iran_plate',
    ),
  );
}
