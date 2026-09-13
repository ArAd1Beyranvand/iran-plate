## 0.4.0

**Azerbaijan, in `src/azerbaijan/`.** Four specs — the civilian car plate, the
motorcycle plate, the diplomatic plate and the foreign-owned-company plate —
plus `AzerbaijanCountry`, `AzerbaijanThemes`, `AzerbaijanColors`, and the flag
SVG this package now also ships.

Same terms as Bahrain: its own folder, no import across any line, no constant
shared with Iran or with Bahrain. Every existing `Iran*` and `Bahrain*` symbol
is untouched.

**Five plates over four specs.** These are the plainest designs in the
workspace — no divider, no security band, no sticker, no printed wording beyond
the `AZ` under the flag — so a class is told apart by exactly two things:

- **The grouping of the serial**, which is the spec. `88-BE-114` is two digits,
  two letters and three; the motorcycle re-lays the same groups in two rows with
  one letter instead of two; a diplomat's is three digits, a class letter and
  three; a foreign company's leads with the class letter and follows it with six
  digits in two threes. The last of those is two registers and two groups rather
  than one of six, because a register's cells are evenly pitched by construction
  and `debugValidateSpec` checks that they are.
- **The colour of the field**, which is the theme. So the blue bus-and-taxi
  plate is `AzerbaijanPlates.car` printed in `AzerbaijanThemes.transport` —
  a civilian number in a civilian layout, one design in two inks. Minting an
  `az.transport` spec identical to `car` but for its id would be putting colour
  on geometry, and `AzerbaijanPlates.all` has four entries for that reason.

Two more things worth knowing:

- Every `AzerbaijanThemes` value is a `PlateTheme.monochrome` — one ink for the
  serial, the hyphens and the frame. That is the exact opposite of
  `BahrainThemes`, none of which can be one.
- `AzerbaijanCountry.azerbaijan` is the *only* country block, coloured field or
  not: a white block with the flag over `AZ` in black, which is why its caption
  ink is fixed rather than themed — on the blue and red plates the plate's own
  white ink would be invisible on it. Its panel box stays clear of the frame
  instead of overlapping it the way an Iranian or German panel does; those are
  darker than their frame and hide the seam under it, and a white block run out
  under a black frame would rub the frame out.

The hyphens on the two civilian plates are `PlateLabel`s at the slots' own glyph
height, not `PlateRule`s: a hyphen is a character printed in the serial's ink,
and a rule would be painted in the divider colour.

Requires `core_plate` ^0.9.1, unchanged.

Every coordinate is sampled by eye from plate photographs.

## 0.3.0

**Bahrain, in `src/bahrain/`.** Five specs — the European-size and
American-size civilian plates, the bicycle plate, the diplomatic corps plate
and the police plate — plus `BahrainCountry`, `BahrainThemes` and
`BahrainColors`, and the flag SVG this package now also ships.

It shares this package for reasons that are not technical and shares nothing
else: no Bahraini file imports an Iranian one or the reverse, and the two sets
have no constant in common. Every existing `Iran*` symbol is untouched.

Three things the designs have in common and one they do not:

- A grey vertical security band on every plate, as a `PlateRule` — which is why
  no Bahraini theme is a `PlateTheme.monochrome`: that constructor makes the
  divider colour the ink, and here the band is grey on plates printed in blue
  and on plates printed near black alike.
- `PlateSpec.panel` holds a flag *or* a coloured band, never both, and never a
  caption. `البحرين` and its Latin partner sit at opposite ends of the plate on
  every design, which one left-aligned column under a flag cannot express, so
  the wording is `PlateLabel`s throughout.
- Labels on the diplomatic and police bands carry `PlateLabel.color`
  (core 0.9.1); the serial keeps the theme's ink.
- The band stands clear of the right frame on the two civilian sizes and runs
  full height hard against it on the other three. That is the difference that
  makes the bicycle plate its own spec rather than a shorter `us`.

Requires `core_plate` ^0.9.1 for `PlateLabel.color`.

Every coordinate is sampled by eye from plate photographs. The police roundel
is deliberately absent; the gap it goes in is left in the head band.

## 0.2.0

- **Both plates' digit runs are registers, not rectangles.** `IranPlates.car`'s
  leading pair, serial triple and province pair, and `IranPlates.bicycle`'s two
  rows, are built by `plateRegister` (core 0.6.0). Each states its own pitch —
  55, 55, 38 on the car; 30 and 33 on the bicycle — because they are separate
  registers with the letter cell and the province divider in the gaps between
  them. The geometry is unchanged to the unit; nothing on a rendered plate
  moves.
- The car's letter cell stays literal: it is wider than a digit and sits on its
  own pitch.
- `IranPlates.car` and `.bicycle` are now `static final` rather than
  `static const`: a `const` constructor cannot run a loop. `PlateSpec` equality
  is over `id` alone and a `static final` is initialised lazily once per
  isolate, so this changes no behaviour — but `const spec = IranPlates.car;`
  must become `final spec = …`, as the example now does.
- Requires `core_plate: ^0.6.0` for `plateRegister`.

## 0.1.0

First pub.dev release.

- Depends on the published `core_plate: ^0.1.0` (was a sibling `path:`
  dependency). The import is `package:core_plate/core_plate.dart`. No API of
  `iran_plate` changed.

- Extracted from `plate-core` (package `plate_number`) at commit `86a0999`,
  core version `0.1.0` (unreleased), as phase P8 of the library split. This is
  a plain move — no code was rewritten in the transfer.
- Contains Iran's plate data: `IranCountry.iran`, `PersianAlphabets.digits` /
  `.plateLetters`, and `IranPlates.car` / `.bicycle`. Depends on `plate_number`
  by path and nothing else.
- Owns `assets/flags/Flag_of_Iran.svg`. It moved out of core's bundle in the
  same commit as the `SvgPlateAsset(package: ...)` literal that names it, so
  there is no revision in which the literal points at a package that does not
  declare the file.
