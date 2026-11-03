/// Iran's licence plates for the `plate_core` library.
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

export 'src/iran_country.dart';

export 'src/iran_colors.dart';

export 'src/iran_themes.dart';

export 'src/iran_usage.dart';

export 'src/persian_alphabets.dart';

export 'src/iran_plates.dart';

export 'src/iran_regions.dart' show IranRegion, IranRegions;
