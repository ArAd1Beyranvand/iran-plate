import 'package:plate_core/plate_core.dart';

import 'iran_colors.dart';
import 'iran_usage.dart';

/// The colour schemes an Iranian plate is printed in.
///
/// Colour is derived from usage, never chosen: a host asks [forUsage] and passes
/// the result to the canvas next to `IranPlates.forUsage`, since a spec carries
/// geometry only.
abstract final class IranThemes {
  /// Rim and corner of the full-size 520×110 plate; no scheme varies them.
  static const double _borderWidthRatio = 0.04;
  static const double _plateRadiusRatio = 0.12;

  /// Private, disabled and temporary plates.
  static const PlateTheme blackOnWhite = PlateTheme.monochrome(
    field: IranColors.white,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Taxi, public transport and agricultural plates.
  static const PlateTheme blackOnYellow = PlateTheme.monochrome(
    field: IranColors.yellow,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Government and protocol plates.
  static const PlateTheme whiteOnRed = PlateTheme.monochrome(
    field: IranColors.red,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Police and IRGC plates.
  static const PlateTheme whiteOnGreen = PlateTheme.monochrome(
    field: IranColors.darkGreen,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Army plates.
  static const PlateTheme blackOnTan = PlateTheme.monochrome(
    field: IranColors.armyTan,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Ministry of Defence and General Staff plates.
  static const PlateTheme whiteOnForcesBlue = PlateTheme.monochrome(
    field: IranColors.forcesBlue,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Political and service plates; a lighter blue than [whiteOnForcesBlue].
  static const PlateTheme blackOnCyan = PlateTheme.monochrome(
    field: IranColors.politicalCyan,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Historic plates, paired only with `IranPlates.historic`.
  static const PlateTheme whiteOnBrown = PlateTheme.monochrome(
    field: IranColors.historicBrown,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// [blackOnWhite] with the heavier rim of the motorcycle blank, matching
  /// `IranPlates.motorcycle`'s `borderWidthRatioOverride`.
  static const PlateTheme motorcycle = PlateTheme.monochrome(
    field: IranColors.white,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: 0.05,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// [PlateSpec.resolveTheme] for `IranPlates.civil`: the colours of the class
  /// the series letter belongs to, on [base]'s rim and corner.
  static PlateTheme civil(PlateTheme base, String Function(String key) group) {
    final t = switch (group('letter')) {
      'ت' || 'ع' || 'ک' => blackOnYellow,
      'الف' => whiteOnRed,
      'پ' || 'ث' => whiteOnGreen,
      'ش' => blackOnTan,
      'ز' || 'ف' => whiteOnForcesBlue,
      'D' || 'S' => blackOnCyan,
      _ => blackOnWhite,
    };
    return base.copyWith(
      plateBackground: t.plateBackground,
      plateBorder: t.plateBorder,
      ink: t.ink,
      dividerColor: t.dividerColor,
      activeColor: t.activeColor,
      inactiveColor: t.inactiveColor,
    );
  }

  static PlateTheme forUsage(IranUsage usage) => switch (usage) {
    IranUsage.private ||
    IranUsage.disabled ||
    IranUsage.temporary => blackOnWhite,
    IranUsage.taxi ||
    IranUsage.publicTransport ||
    IranUsage.agricultural => blackOnYellow,
    IranUsage.government || IranUsage.protocol => whiteOnRed,
    IranUsage.police || IranUsage.irgc => whiteOnGreen,
    IranUsage.army => blackOnTan,
    IranUsage.ministryOfDefence || IranUsage.generalStaff => whiteOnForcesBlue,
    IranUsage.political || IranUsage.service => blackOnCyan,
    IranUsage.historic => whiteOnBrown,
    IranUsage.motorcycle => motorcycle,
  };
}
