FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

Iran's licence plates for [`core_plate`](https://pub.dev/packages/core_plate) - a country
that, as the licence header insists, actually exists. Bahrain's and Azerbaijan's ride
along in the same package.

## Also available

- [`core_plate`](https://pub.dev/packages/core_plate) - Paint license plates.
- [`core_plate_bloc`](https://pub.dev/packages/core_plate_bloc) - The optional bloc layer for `core_plate`.
- [`germany_plate`](https://pub.dev/packages/germany_plate) - Germany's plates.
- [`palestine_plate`](https://pub.dev/packages/palestine_plate) - Palestine's plates.
- [`yemen_plate`](https://pub.dev/packages/yemen_plate) - Yemen's plates.
- [`plate_keypad`](https://pub.dev/packages/plate_keypad) - A character picker for license plates.

# iran_plate

It's data, not code: the country panels with the flag SVGs this package ships, the Persian
digit and plate-letter alphabets, and the plate specs for three countries. `core_plate`
paints them.

## Depends on

`core_plate` (`^0.1.0`). Nothing else - not `germany_plate`, not `plate_keypad`,
not `core_plate_bloc`.

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
from `plate_keypad` if you've got it - the repo's `plate_gallery/` app wires exactly
that, next to every plate the other country packages draw.

## Contains

- `IranCountry.iran` - the panel and `Flag_of_Iran.svg`.
- `PersianAlphabets.digits` / `.plateLetters`.
- `IranPlates.car` / `.bicycle`.

### Bahrain, in `src/bahrain/`

- `BahrainCountry.civilian` / `.diplomatic` / `.police`, and `Flag_of_Bahrain.svg`.
- `BahrainColors`, `BahrainThemes.civilian` / `.diplomatic` / `.police`.
- `BahrainPlates.eu` / `.us` / `.bicycle` / `.diplomatic` / `.police`, and `.all`.

### Azerbaijan, in `src/azerbaijan/`

- `AzerbaijanCountry.azerbaijan` - one block for every class, and `Flag_of_Azerbaijan.svg`.
- `AzerbaijanColors`, `AzerbaijanThemes.civilian` / `.transport` / `.diplomatic` / `.foreign`.
- `AzerbaijanPlates.car` / `.bicycle` / `.diplomatic` / `.foreign`, and `.all`.

Five plates over four specs. An Azerbaijani class is the colour of the field and the
grouping of the serial and nothing else - no divider, no security band, no sticker, and
the same white flag-over-`AZ` block whatever the field is. So the blue bus-and-taxi
plate is the car spec in another theme rather than a spec of its own:

```dart
PlateCanvas(spec: AzerbaijanPlates.car, theme: AzerbaijanThemes.civilian, ...);  // 88-BE-114
PlateCanvas(spec: AzerbaijanPlates.car, theme: AzerbaijanThemes.transport, ...); // 10-TH-308
```

These three countries share this package and nothing else: no file in one folder imports
one in another, and they have no constant in common.
