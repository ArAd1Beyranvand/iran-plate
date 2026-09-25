import 'package:core_plate/core_plate.dart';

import 'iran_colors.dart';
import 'iran_usage.dart';

/// The colour schemes an Iranian plate is printed in, and the lookup that
/// derives one from a plate's usage.
///
/// **Colour is derived, never chosen.** A host does not decide that this plate
/// is yellow; it knows the plate is a taxi and asks [forUsage]. That is why
/// [IranUsage] exists as an axis separate from [PlateSpec].
///
/// [PlateSpec] carries no theme field — a spec describes geometry, a theme
/// describes colour, and `core_plate` keeps them apart deliberately — so the
/// host passes both:
///
/// ```dart
/// PlateCanvas(
///   spec: IranPlates.forUsage(IranUsage.taxi),
///   theme: IranThemes.forUsage(IranUsage.taxi),
///   onChooseCharacter: PlateCharacterPicker.show,
/// );
/// ```
///
/// or wraps the canvas in a `PlateThemeScope`.
///
/// ## The ratios
///
/// Every scheme prints the same rim and the same corner: `borderWidthRatio`
/// 0.04 and `plateRadiusRatio` 0.12 on the full-size 520×110 plate, which is
/// what `PlateTheme.standard()` already used for `IranPlates.car` and what the
/// reference images show. Nothing suggests the colour changes the printing, so
/// none of the schemes below vary them. The motorcycle plate is a different
/// form factor and takes a heavier rim — see [motorcycle].
abstract final class IranThemes {
  /// The rim and corner of a full-size 520×110 Iranian plate.
  static const double _borderWidthRatio = 0.04;
  static const double _plateRadiusRatio = 0.12;

  /// Black on white: private cars, disabled drivers' cars, temporary-passage
  /// plates and motorcycles. The ordinary Iranian plate.
  static const PlateTheme blackOnWhite = PlateTheme.monochrome(
    field: IranColors.white,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Black on yellow: the three for-hire classes — taxi, public transport and
  /// agricultural. One field, three different fixed letters.
  static const PlateTheme blackOnYellow = PlateTheme.monochrome(
    field: IranColors.yellow,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// White on red: government (`الف`) and protocol (`تشریفات`) vehicles.
  static const PlateTheme whiteOnRed = PlateTheme.monochrome(
    field: IranColors.red,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// White on dark green: FARAJA police (`پ`) and IRGC (`ث`).
  static const PlateTheme whiteOnGreen = PlateTheme.monochrome(
    field: IranColors.darkGreen,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Black on light brown: Islamic Republic of Iran Army (`ش`). The one
  /// Iranian field that is neither white nor yellow and still takes black ink.
  static const PlateTheme blackOnTan = PlateTheme.monochrome(
    field: IranColors.armyTan,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// White on light blue: Ministry of Defence (`ز`) and General Staff (`ف`).
  static const PlateTheme whiteOnForcesBlue = PlateTheme.monochrome(
    field: IranColors.forcesBlue,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Black on cyan: political (`D`) and service (`S`) plates. A different,
  /// lighter blue from [whiteOnForcesBlue], and printed in black rather than
  /// white — two plates, not one colour rendered twice.
  static const PlateTheme blackOnCyan = PlateTheme.monochrome(
    field: IranColors.politicalCyan,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// White on brown: historic vehicles. Paired only with
  /// `IranPlates.historic`, which is the American-standard form factor the
  /// scheme is printed on.
  static const PlateTheme whiteOnBrown = PlateTheme.monochrome(
    field: IranColors.historicBrown,
    ink: IranColors.white,
    inactive: IranColors.inactiveOnDark,
    borderWidthRatio: _borderWidthRatio,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// Black on white on the taller motorcycle blank. Same colours as
  /// [blackOnWhite]; the rim is a larger fraction of the height because the
  /// plate is shorter and wider in proportion, matching
  /// `IranPlates.motorcycle`'s own `borderWidthRatioOverride`.
  static const PlateTheme motorcycle = PlateTheme.monochrome(
    field: IranColors.white,
    ink: IranColors.black,
    inactive: IranColors.inactiveOnLight,
    borderWidthRatio: 0.05,
    plateRadiusRatio: _plateRadiusRatio,
  );

  /// The scheme a plate of this usage is printed in. Colour is *derived* from
  /// usage — a host never picks a theme directly.
  static PlateTheme forUsage(IranUsage usage) => switch (usage) {
    IranUsage.private => blackOnWhite,
    IranUsage.disabled => blackOnWhite,
    IranUsage.temporary => blackOnWhite,
    IranUsage.taxi => blackOnYellow,
    IranUsage.publicTransport => blackOnYellow,
    IranUsage.agricultural => blackOnYellow,
    IranUsage.government => whiteOnRed,
    IranUsage.protocol => whiteOnRed,
    IranUsage.police => whiteOnGreen,
    IranUsage.irgc => whiteOnGreen,
    IranUsage.army => blackOnTan,
    IranUsage.ministryOfDefence => whiteOnForcesBlue,
    IranUsage.generalStaff => whiteOnForcesBlue,
    IranUsage.political => blackOnCyan,
    IranUsage.service => blackOnCyan,
    IranUsage.historic => whiteOnBrown,
    IranUsage.motorcycle => motorcycle,
  };
}
