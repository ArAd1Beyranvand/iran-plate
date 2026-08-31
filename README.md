# iran_plate

Iran's licence plates for the [`plate_number`](../plate-core) library (renamed
`core_plate` in a later phase of the split). It is data, not code: the country
panel with the flag SVG this package ships, the Persian digit and plate-letter
alphabets, and the car and bicycle specs. The core widget layer paints them —
adding a plate means adding a `const`, never a widget.

## Depends on

`plate_number` (by path), for `PlateSpec`, `PlateCountry` and `PlateAlphabet`.
Nothing else — not `germany_plate`, not `plate_keypad`.

## Use

```dart
import 'package:iran_plate/iran_plate.dart';

PlateCanvas(spec: IranPlates.car, onChooseCharacter: PlateCharacterPicker.show);
```
