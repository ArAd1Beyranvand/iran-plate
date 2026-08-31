/// Iran's licence plates for the `plate_number` / `core_plate` library.
///
/// Data, not code: a [PlateCountry], two [PlateAlphabet]s and two [PlateSpec]s
/// that the core widget layer paints. Nothing here knows about any other
/// country package.
///
/// ```dart
/// PlateCanvas(spec: IranPlates.car, ...)
/// ```
library;

/// The country panel — caption, colours, and the flag SVG this package ships.
export 'src/iran_country.dart';

/// The Persian digit and plate-letter alphabets, including their RTL reading
/// direction and the `؟` empty-slot placeholder.
export 'src/persian_alphabets.dart';

/// The car and bicycle plate specs.
export 'src/iran_plates.dart';
