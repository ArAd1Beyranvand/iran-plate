import 'package:flutter/widgets.dart';

/// Every colour an Iranian plate is printed in, sampled from the reference
/// images of the Wikipedia article on Iranian plates. Read only by `IranThemes`
/// and `IranCountry`.
abstract final class IranColors {
  /// The field of a private, disabled or motorcycle plate.
  static const Color white = Color(0xFFFFFFFF);

  /// Ink of the light-field plates; the references print a warm dark grey, not
  /// pure black.
  static const Color black = Color(0xFF1D1D1B);

  /// The field of the three for-hire classes — taxi, public and agricultural.
  static const Color yellow = Color(0xFFFFC913);

  /// The field of a government or protocol plate.
  static const Color red = Color(0xFFED1C24);

  /// The field of a police (FARAJA) or IRGC plate.
  static const Color darkGreen = Color(0xFF005329);

  /// The field of an army plate.
  static const Color armyTan = Color(0xFFCEA160);

  /// The field shared by the Ministry of Defence and General Staff plates.
  static const Color forcesBlue = Color(0xFF0079C1);

  /// The field of a political or service plate; lighter than [forcesBlue].
  static const Color politicalCyan = Color(0xFF00A2E8);

  /// The field of a historic-vehicle plate.
  static const Color historicBrown = Color(0xFF643200);

  /// The country panel beside the flag, the same on every class.
  static const Color panelBlue = Color(0xFF16479D);

  /// Outline under an empty field on a light plate; input chrome, never printed.
  static const Color inactiveOnLight = Color(0x66666666);

  /// [inactiveOnLight] for dark plates, where grey would vanish.
  static const Color inactiveOnDark = Color(0x88FFFFFF);
}
