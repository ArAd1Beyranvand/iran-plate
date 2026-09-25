/// Iran's licence plates for the `core_plate` library.
///
/// Data, not code: a [PlateCountry], the Persian alphabets, the usage-derived
/// themes, and the [PlateSpec] consts the core widget layer paints. Nothing here
/// knows about any other country package.
///
/// Iran encodes the vehicle class in the **series letter** — free on a private
/// plate, fixed for every other class — and in the field colour. Both are
/// derived from one [IranUsage], never chosen:
///
/// ```dart
/// PlateCanvas(
///   spec: IranPlates.forUsage(IranUsage.taxi),
///   theme: IranThemes.forUsage(IranUsage.taxi),
///   onChooseCharacter: showMyPicker, // the host's; core ships no picker
/// );
/// ```
///
/// For Bahrain and Azerbaijan plates, use the `iranshahr` package instead.
library;

/// The country panel — caption, colours, and the flag SVG this package ships.
export 'src/iran_country.dart';

/// Every colour an Iranian plate is printed in, sampled from the reference
/// images.
export 'src/iran_colors.dart';

/// The colour schemes a plate is printed in, and the usage -> theme lookup.
export 'src/iran_themes.dart';

/// What a plate is licensed for, and the series letter each class is fixed to.
export 'src/iran_usage.dart';

/// The Persian digit and letter alphabets — the private county series, the
/// one-character series letters, and the `ژ` -> `♿︎` disabled symbol.
export 'src/persian_alphabets.dart';

/// The plate specs: the shared 520x110 blank in fifteen classes, plus the
/// protocol, historic and motorcycle blanks.
export 'src/iran_plates.dart';
