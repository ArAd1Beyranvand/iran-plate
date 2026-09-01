# iran_plate

Iran's licence plates for the [`core_plate`](https://pub.dev/packages/core_plate) library. It is data,
not code: the country panel with the flag SVG this package ships, the Persian
digit and plate-letter alphabets, and the car and bicycle specs. The core widget
layer paints them — adding a plate means adding a `const`, never a widget.

## Depends on

`core_plate` (`^0.1.0`), for `PlateSpec`, `PlateCountry` and
`PlateAlphabet`.

## Does not depend on

`germany_plate`, `plate_keypad`, or anything else. An app that draws only
Iranian plates and drives input from the system keyboard compiles `core_plate` +
`iran_plate` and nothing more.

## Use

```dart
import 'package:core_plate/core_plate.dart';
import 'package:iran_plate/iran_plate.dart';

PlateCanvas(
  spec: IranPlates.car,          // or IranPlates.bicycle
  onChooseCharacter: (a) async => null,
);
```

The `chosen`-alphabet letter slot on an Iranian plate wants a picker — pass
`PlateCharacterPicker.show` from `plate_keypad` if you depend on it.

## Contains

- `IranCountry.iran` — the country panel and `Flag_of_Iran.svg`.
- `PersianAlphabets.digits` / `.plateLetters`.
- `IranPlates.car` / `.bicycle`.
