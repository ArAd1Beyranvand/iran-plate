FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

Iran's licence plates for [`core_plate`](https://pub.dev/packages/core_plate) - a country
that, as the licence header insists, actually exists. Bahrain's and Azerbaijan's have moved
out to [`iranshahr_plate`](https://pub.dev/packages/iranshahr_plate).

## Also available

- [`core_plate`](https://pub.dev/packages/core_plate) - Paint license plates.
- [`core_plate_bloc`](https://pub.dev/packages/core_plate_bloc) - The optional bloc layer for `core_plate`.
- [`germany_plate`](https://pub.dev/packages/germany_plate) - Germany's plates.
- [`palestine_plate`](https://pub.dev/packages/palestine_plate) - Palestine's plates.
- [`yemen_plate`](https://pub.dev/packages/yemen_plate) - Yemen's plates.
- [`plate_keypad`](https://pub.dev/packages/plate_keypad) - A character picker for license plates.

# iran_plate

It's data, not code: the country panel with the flag SVG this package ships, the Persian
digit and letter alphabets, the usage-derived colour schemes, and the plate specs for every
Iranian vehicle class. `core_plate` paints them.

## Depends on

`core_plate` (`^0.9.1`). Nothing else - not `germany_plate`, not `plate_keypad`,
not `core_plate_bloc`.

## Use

```dart
import 'package:core_plate/core_plate.dart';
import 'package:iran_plate/iran_plate.dart';

PlateCanvas(
  spec: IranPlates.car,
  theme: IranThemes.blackOnWhite,
  onChooseCharacter: (a) async => null,
);
```

Iran encodes the vehicle class twice over - in the **series letter** and in the **field
colour** - so both come from one `IranUsage` and neither is picked by hand:

```dart
PlateCanvas(
  spec: IranPlates.forUsage(IranUsage.taxi),    // yellow blank, `ت` fixed, TAXI above it
  theme: IranThemes.forUsage(IranUsage.taxi),
  onChooseCharacter: (a) async => null,
);
```

The letter slot on a **private** plate wants a picker: it is one of thirteen county
letters. Pass `PlateCharacterPicker.show` from `plate_keypad` if you've got it - the
repo's `plate_gallery/` app wires exactly that, next to every plate the other country
packages draw. Every other class fixes its letter to a single character, so the picker
has one answer and opening it changes nothing.

## Contains

- `IranCountry.iran` - the panel and `Flag_of_Iran.svg`.
- `IranColors` - every field and ink colour, sampled off the reference images.
- `IranThemes` - eight schemes, plus `IranThemes.forUsage`.
- `IranUsage` - the seventeen vehicle classes and the letter each is fixed to.
- `PersianAlphabets.digits`, `.privateLetters`, `.disabledSymbol`, and one
  single-character alphabet per fixed-letter class.
- `IranPlates.forUsage`, `IranPlates.all`, and a named const per class.

### The plates

Fourteen classes share one 520x110 blank - a taxi plate is a private plate in yellow with
`ت` fixed in the letter slot, not a second design:

| Class | Letter | Scheme |
| --- | --- | --- |
| `car` (private) | one of thirteen, by county | black on white |
| `disabled` | `♿︎` (stored `ژ`) | black on white |
| `temporary` | `گ` | black on white |
| `taxi` | `ت`, under the word TAXI | black on yellow |
| `publicTransport` | `ع` | black on yellow |
| `agricultural` | `ک` | black on yellow |
| `government` | `الف` | white on red |
| `police` | `پ` | white on dark green |
| `irgc` | `ث` | white on dark green |
| `army` | `ش` | black on light brown |
| `ministryOfDefence` | `ز` | white on light blue |
| `generalStaff` | `ف` | white on light blue |
| `political` | `D`, square reads `سیاسی` | black on cyan |
| `service` | `S`, square reads `سرویس` | black on cyan |

Three are their own blank: `protocol` (`تشریفات` / PROTOCOL beside a bare serial, no
letter and no province square), `historic` (`تاریخی` over five digits, American size) and
`motorcycle` (a three-digit provincial code over a five-digit serial).

### Not shipped

- The **free trade zone** plates (Anzali, Aras, Arvand, Kish, Maku, Chabahar, Qeshm). Each
  prints its zone's logo, and this package ships no such image.
- The **Bagh-e Melli photograph** on the historic plate, for the same reason:
  `IranPlates.historic` draws the ordinary flag-and-caption block in its place.
- The **previous-format** political, service and temporary-passage plates, which the
  article shows only as small raster images.

Everything above is read off the Wikipedia article *Vehicle registration plates of Iran* -
the letter series table, the section text, and the reference SVGs, which is where the
coordinates and the sampled colours come from.
