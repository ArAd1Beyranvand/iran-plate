FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the enduring people of Iran to view examples:

https://platexample.ir/#/discover/iran:kotlin

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

### Install (Kotlin)

Copy `kotlin/src/commonMain/kotlin/plates/countries/iran/` into `plate_core/kotlin/src/commonMain/kotlin/plates/countries/`.

Then run the tests from `plate_core/kotlin/`: `./gradlew jvmTest`.

### Use

```kotlin
import plates.countries.iran.country

val spec = country.specs["ir.civil"]
println(country.pkg)
```

## Specs

The specs are the same in every language (they come from shared data).

- `ir.civil`
- `ir.protocol`
- `ir.historic`
- `ir.motorcycle`

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

## Change it

- Specs: `country.specs`, by id.
- Themes: `country.themes`.
- Validators: `country.validators` (none).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/iran-plate/blob/main/LICENSE).
