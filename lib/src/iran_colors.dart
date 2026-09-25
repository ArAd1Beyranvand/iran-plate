import 'package:flutter/widgets.dart';

/// Every colour an Iranian plate is printed in.
///
/// Sampled from the reference images on the Wikipedia article
/// *Vehicle registration plates of Iran* — the SVG plates for the civil
/// classes (private, disabled, taxi, public, agricultural, government) and the
/// `Pelak melie *` renderings for the military, political and protocol ones.
/// Each value below is the modal field or ink colour of the corresponding
/// image, so they are measurements rather than guesses.
///
/// Colour never goes into a [PlateSpec]: a spec is geometry. It goes into a
/// `PlateTheme` — see `IranThemes`, which is the only thing that should read
/// this class.
abstract final class IranColors {
  /// The field of a private, disabled or motorcycle plate.
  static const Color white = Color(0xFFFFFFFF);

  /// The ink of every light-field plate. Not pure black: the reference SVGs
  /// print a very dark warm grey, and matching it keeps the digits from
  /// looking heavier than the photographs.
  static const Color black = Color(0xFF1D1D1B);

  /// The field of the three for-hire classes — taxi, public and agricultural.
  static const Color yellow = Color(0xFFFFC913);

  /// The field of a government or protocol plate.
  static const Color red = Color(0xFFED1C24);

  /// The field of a police (FARAJA) or IRGC plate.
  static const Color darkGreen = Color(0xFF005329);

  /// The field of an Islamic Republic of Iran Army plate — the "light shade of
  /// brown" the article describes, and the only Iranian field that takes black
  /// ink without being white or yellow.
  static const Color armyTan = Color(0xFFCEA160);

  /// The field shared by the Ministry of Defence and General Staff plates.
  static const Color forcesBlue = Color(0xFF0079C1);

  /// The field of a political (diplomatic/consular) or service plate. A
  /// noticeably lighter, cyan-leaning blue than [forcesBlue]; the two are
  /// different plates, not one colour drifting between renderings.
  static const Color politicalCyan = Color(0xFF00A2E8);

  /// The field of a historic-vehicle plate.
  static const Color historicBrown = Color(0xFF643200);

  /// The country block beside the flag. Unchanged across every class above:
  /// only the field and the ink vary, never the panel.
  static const Color panelBlue = Color(0xFF16479D);

  /// Input chrome, never printed: the outline core paints under an empty field
  /// on a light plate (white, yellow, tan).
  static const Color inactiveOnLight = Color(0x66666666);

  /// Input chrome, never printed: the same outline on a dark plate (red,
  /// green, blue). A grey that reads on white vanishes on these.
  static const Color inactiveOnDark = Color(0x88FFFFFF);
}
