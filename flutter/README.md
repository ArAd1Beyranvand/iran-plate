FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the enduring people of Iran to view examples:

https://platexample.ir/#/discover/iran:flutter

# iran_plate

Iran's licence plates for the plate_core library — country panels, the Persian alphabets, and the Iranian plate specs.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/iran-plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/iran:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/iran-plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/iran:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/iran-plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/iran:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/iran-plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/iran:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  iran_plate: ^0.6.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:iran_plate/iran_plate.dart';

PlateCanvas(
  spec: IranPlates.forUsage(IranUsage.taxi),
  theme: IranThemes.forUsage(IranUsage.taxi),
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `IranPlates.civil` — id `ir.civil`
- `IranPlates.protocol` — id `ir.protocol`
- `IranPlates.historic` — id `ir.historic`
- `IranPlates.motorcycle` — id `ir.motorcycle`
- `IranPlates.forUsage`(…)

## Themes

- `IranThemes.blackOnWhite`
- `IranThemes.blackOnYellow`
- `IranThemes.whiteOnRed`
- `IranThemes.whiteOnGreen`
- `IranThemes.blackOnTan`
- `IranThemes.whiteOnForcesBlue`
- `IranThemes.blackOnCyan`
- `IranThemes.whiteOnBrown`
- `IranThemes.motorcycle`
- `IranThemes.civil`(…)
- `IranThemes.forUsage`(…)

## Change it

`PlateCanvas` takes `spec:` (an entry of `IranPlates`) and `theme:` (an entry of `IranThemes`).

## Also included

- `IranCountry` — the country panel.
- `IranRegions` — code table.

## Plates

Iranian plate designs. The fourteen civil, military and diplomatic classes
are one spec, `civil`: the series letter picks the livery (`IranThemes.civil`)
and the wording (the TAXI label). `protocol`, `historic`,
`motorcycle` are written in full.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/iran-plate/blob/main/LICENSE).
