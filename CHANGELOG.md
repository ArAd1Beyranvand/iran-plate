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
