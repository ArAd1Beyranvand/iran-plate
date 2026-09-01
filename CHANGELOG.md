## Unreleased

### P9 — the core is renamed

- The core dependency is now **`core_plate`** (was `plate_number`), resolved at
  `{path: ../core-plate}` (was `../plate-core`). The import inside this package
  is `package:core_plate/core_plate.dart`. No API of `iran_plate` changed.
- Path-only: this package is not published to pub.dev (`core-plate/docs/split/PLAN.md`
  §6.6).

## 0.1.0

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
