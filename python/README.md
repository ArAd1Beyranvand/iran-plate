FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the enduring people of Iran to view examples:

https://platexample.ir/#/discover/iran:python

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

### Install (Python)

Copy `python/plates/countries/iran/` into `plate_core/python/plates/countries/`.

Then run the tests from `plate_core/python/`: `pytest`.

### Use

```python
from plates.countries.iran.data import SPECS, THEMES

spec = SPECS["ir.civil"]
theme = THEMES["IranThemes.blackOnWhite"]
print(spec.id)
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

- Pick a spec: use another key of `SPECS`.
- Pick a theme: use another key of `THEMES`.
- Validators: `VALIDATORS` maps the names none to classes.

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/iran-plate/blob/main/LICENSE).
