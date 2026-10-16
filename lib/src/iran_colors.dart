import 'package:flutter/widgets.dart';

/// Sampled from the reference images of the Wikipedia article on Iranian
/// plates.
abstract final class IranColors {
  static const Color white = Color(0xFFFFFFFF);

  /// Ink of the light-field plates; the references print a warm dark grey, not
  /// pure black.
  static const Color black = Color(0xFF1D1D1B);

  static const Color yellow = Color(0xFFFFC913);

  static const Color red = Color(0xFFED1C24);

  static const Color darkGreen = Color(0xFF005329);

  static const Color armyTan = Color(0xFFCEA160);

  /// The field shared by the Ministry of Defence and General Staff plates.
  static const Color forcesBlue = Color(0xFF0079C1);

  /// The field of a political or service plate; lighter than [forcesBlue].
  static const Color politicalCyan = Color(0xFF00A2E8);

  static const Color historicBrown = Color(0xFF643200);

  static const Color panelBlue = Color(0xFF16479D);

  /// Outline under an empty field on a light plate; input chrome, never printed.
  static const Color inactiveOnLight = Color(0x66666666);

  /// [inactiveOnLight] for dark plates, where grey would vanish.
  static const Color inactiveOnDark = Color(0x88FFFFFF);
}
