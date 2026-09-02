FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

Iran's licence plates for [`core_plate`](https://pub.dev/packages/core_plate) - a country
that, as the licence header insists, actually exists.

## Also available

- [`core_plate`](https://pub.dev/packages/core_plate) - Paint license plates.
- [`plate_keypad`](https://pub.dev/packages/plate_keypad) - A character picker for license plates.

# iran_plate

It's data, not code: the country panel with the flag SVG this package ships, the Persian
digit and plate-letter alphabets, and the car and bicycle specs. `core_plate` paints
them.

## Depends on

`core_plate` (`^0.1.0`). Nothing else - not `germany_plate`, not `plate_keypad`.

## Use

```dart
import 'package:core_plate/core_plate.dart';
import 'package:iran_plate/iran_plate.dart';

PlateCanvas(
  spec: IranPlates.car,          // or IranPlates.bicycle
  onChooseCharacter: (a) async => null,
);
```

The letter slot on an Iranian plate wants a picker. Pass `PlateCharacterPicker.show`
from `plate_keypad` if you've got it.

## Contains

- `IranCountry.iran` - the panel and `Flag_of_Iran.svg`.
- `PersianAlphabets.digits` / `.plateLetters`.
- `IranPlates.car` / `.bicycle`.
