FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the enduring people of Iran to view examples:

https://platexample.ir/#/discover/iran

# iran_plate

Iran's licence plates for the `plate_core` library. Iran encodes the vehicle class in the **series letter** — free on a private plate, fixed for every other class — and in the field colour. Both are derived from one `IranUsage`, never chosen. Bahrain's and Azerbaijan's plates live in `iranshahr_plate`.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  iran_plate: ^0.6.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:iran_plate/iran_plate.dart';

PlateCanvas(
  spec: IranPlates.forUsage(IranUsage.taxi),
  theme: IranThemes.forUsage(IranUsage.taxi),
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `IranCountry` — country panel: `iran`.
- `IranPlates` — 5 plate specs: `civil`, `protocol`, `historic`, `motorcycle`, `forUsage()`.
- `IranThemes` — 9 themes: `blackOnWhite`, `blackOnYellow`, `whiteOnRed`, `whiteOnGreen`, `blackOnTan`, `whiteOnForcesBlue`, `blackOnCyan`, `whiteOnBrown`, `motorcycle`.
- `IranRegions` — code table.
- 2 bundled assets (`Flag_of_Iran.svg`, `historic_bagh_e_melli.png`).

## Plates

Iranian plate designs. The fourteen civil, military and diplomatic classes
are one spec, `civil`: the series letter picks the livery (`IranThemes.civil`)
and the wording (the TAXI label). `protocol`, `historic`,
`motorcycle` are written in full.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

