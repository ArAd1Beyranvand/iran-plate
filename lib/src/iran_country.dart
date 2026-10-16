import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'iran_colors.dart';

abstract final class IranCountry {
  static const PlateCountry iran = PlateCountry(
    code: 'ir',
    captionLines: ['I.R.', 'IRAN'],
    panelColor: IranColors.panelBlue,
    panelTextColor: Color(0xFFFFFFFF),
    flagAspectRatio: 7 / 4,
    flag: SvgPlateAsset('assets/flags/Flag_of_Iran.svg', package: 'iran_plate'),
  );
}
