import 'package:flutter/widgets.dart';
import 'package:core_plate/core_plate.dart';

import 'iran_country.dart';
import 'iran_usage.dart';
import 'persian_alphabets.dart';

/// Iranian plate designs. One geometry, many liveries: shared [_standard] with
/// data-driven letter, box, labels; colour in [IranThemes]. [protocol],
/// [historic], [motorcycle] are written in full.
abstract final class IranPlates {
  // --- The shared 520x110 blank ---------------------------------------------

  /// Shared blank: digit pair, letter, serial triple, province pair. `final`
  /// not `const`: [plateRegister] runs a loop.
  static PlateSpec _standard({
    required String id,
    required PlateAlphabet letter,
    PlateBox letterBox = const PlateBox(175, 17, 55, 76),
    String squareCaption = 'ایران',
    List<PlateLabel> extraLabels = const <PlateLabel>[],
  }) {
    return PlateSpec(
      id: id,
      country: IranCountry.iran,
      canvasWidth: 520,
      canvasHeight: 110,
      panel: const PlatePanel(box: PlateBox(0, 0, 56.4, 110)),
      textDirection: TextDirection.rtl,
      slots: [
        ...plateRegister(
          alphabet: PersianAlphabets.digits,
          count: 2,
          left: 65,
          top: 17,
          width: 47,
          height: 76,
          pitch: 55,
        ),
        PlateSlot(alphabet: letter, box: letterBox),
        ...plateRegister(
          alphabet: PersianAlphabets.digits,
          count: 3,
          left: 238,
          top: 17,
          width: 47,
          height: 76,
          pitch: 55,
        ),
        ...plateRegister(
          alphabet: PersianAlphabets.digits,
          count: 2,
          left: 428,
          top: 40,
          width: 32,
          height: 52,
          pitch: 38,
        ),
      ],
      // The panel strip, the serial, then the province square behind a
      // divider at x 404..409 from frame to frame.
      background: const PlateSection.columns([
        PlatePart(PlateSection.fill(PlateFill.panel), end: 56.4),
        PlatePart(PlateSection.plain, end: 406.5, divider: 5),
        PlatePart(PlateSection.plain),
      ]),
      labels: [
        PlateLabel(
          text: squareCaption,
          box: const PlateBox(412, 18, 103, 16),
          glyphHeight: 16,
        ),
        ...extraLabels,
      ],
      textGroups: const [
        PlateTextGroup([0, 1], key: 'district'),
        PlateTextGroup([2], key: 'letter'),
        PlateTextGroup([3, 4, 5], key: 'serial'),
        PlateTextGroup([6, 7], prefix: 'IR ', key: 'province'),
      ],
    );
  }

  // --- Civil classes --------------------------------------------------------

  /// Private cars: letter from county series.
  static final PlateSpec car = _standard(
    id: 'ir.car',
    letter: PersianAlphabets.privateLetters,
  );

  /// Disabled vehicles: wheelchair symbol fixed; wider slot (66 vs 55).
  static final PlateSpec disabled = _standard(
    id: 'ir.disabled',
    letter: PersianAlphabets.disabledSymbol,
    letterBox: const PlateBox(170, 16, 66, 77),
  );

  /// Taxis: `ت` fixed with TAXI label; letter slot lower (top 41).
  static final PlateSpec taxi = _standard(
    id: 'ir.taxi',
    letter: PersianAlphabets.taxiLetter,
    letterBox: const PlateBox(175, 41, 55, 52),
    extraLabels: const [
      PlateLabel(text: 'TAXI', box: PlateBox(158, 12, 89, 26), glyphHeight: 26),
    ],
  );

  /// Public transport: black on yellow, `ع` fixed (for عمومی).
  static final PlateSpec publicTransport = _standard(
    id: 'ir.public',
    letter: PersianAlphabets.publicLetter,
  );

  /// Agricultural vehicles: black on yellow, `ک` fixed (for کشاورزی).
  static final PlateSpec agricultural = _standard(
    id: 'ir.agricultural',
    letter: PersianAlphabets.agriculturalLetter,
  );

  /// Government vehicles: `الف` fixed; wider box (70).
  static final PlateSpec government = _standard(
    id: 'ir.government',
    letter: PersianAlphabets.governmentLetter,
    letterBox: const PlateBox(168, 17, 70, 76),
  );

  /// Temporary passage: `گ` fixed; for newly built cars.
  static final PlateSpec temporary = _standard(
    id: 'ir.temporary',
    letter: PersianAlphabets.temporaryLetter,
  );

  // --- Military and law enforcement -----------------------------------------

  /// Police: `پ` fixed (for پلیس).
  static final PlateSpec police = _standard(
    id: 'ir.police',
    letter: PersianAlphabets.policeLetter,
  );

  /// IRGC: `ث` fixed.
  static final PlateSpec irgc = _standard(
    id: 'ir.irgc',
    letter: PersianAlphabets.irgcLetter,
  );

  /// Army: `ش` fixed.
  static final PlateSpec army = _standard(
    id: 'ir.army',
    letter: PersianAlphabets.armyLetter,
  );

  /// Ministry of Defence: `ز` fixed.
  static final PlateSpec ministryOfDefence = _standard(
    id: 'ir.defence',
    letter: PersianAlphabets.defenceLetter,
  );

  /// General Staff: `ف` fixed.
  static final PlateSpec generalStaff = _standard(
    id: 'ir.generalStaff',
    letter: PersianAlphabets.generalStaffLetter,
  );

  // --- Political and service ------------------------------------------------

  /// Diplomatic corps: `D` fixed; square captioned `سیاسی`.
  static final PlateSpec political = _standard(
    id: 'ir.political',
    letter: PersianAlphabets.politicalLetter,
    squareCaption: 'سیاسی',
  );

  /// International-organisation service plates (UNHCR and the like): black on
  /// cyan, Latin `S` fixed, square captioned `سرویس`. [political]'s
  /// counterpart, and numbered the same way.
  static final PlateSpec service = _standard(
    id: 'ir.service',
    letter: PersianAlphabets.serviceLetter,
    squareCaption: 'سرویس',
  );

  // --- The plates that are not the standard blank ---------------------------

  /// Protocol vehicles: white on red, `تشریفات` over its English translation
  /// beside a bare serial. No series letter, no divider and no province square
  /// — the one full-size Iranian plate that is not a registration in the usual
  /// format.
  ///
  /// Five digits, not four. The article says "simply a four-digit number", but
  /// the image it illustrates the section with reads `۱۳۹۰۱`, and the five
  /// cells measure evenly across the space left of the wording. The picture is
  /// the primary source here.
  static final PlateSpec protocol = PlateSpec(
    id: 'ir.protocol',
    country: IranCountry.iran,
    canvasWidth: 520,
    canvasHeight: 110,
    panel: const PlatePanel(box: PlateBox(0, 0, 56.4, 110)),
    background: const PlateSection.columns([
      PlatePart(PlateSection.fill(PlateFill.panel), end: 56.4),
      PlatePart(PlateSection.plain),
    ]),
    textDirection: TextDirection.rtl,
    slots: plateRegisterAcross(
      alphabet: PersianAlphabets.digits,
      count: 5,
      left: 294,
      right: 497,
      top: 16,
      height: 76,
    ),
    labels: const [
      PlateLabel(
        text: 'تشریفات',
        box: PlateBox(63, 4, 221, 52),
        glyphHeight: 48,
      ),
      PlateLabel(
        text: 'PROTOCOL',
        box: PlateBox(63, 56, 221, 42),
        glyphHeight: 42,
      ),
    ],
    textGroups: const [
      PlateTextGroup([0, 1, 2, 3, 4], key: 'serial'),
    ],
  );

  /// Historic vehicles: `تاریخی` and five-digit serial; American-standard blank.
  /// No Bagh-e Melli image (geometry calibrated by eye).
  static final PlateSpec historic = PlateSpec(
    id: 'ir.historic',
    country: IranCountry.iran,
    canvasWidth: 300,
    canvasHeight: 150,
    panel: const PlatePanel(
      box: PlateBox(0, 0, 105, 150),
      flagScale: 0.8,
      captionScale: 0.5,
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
    ),
    background: const PlateSection.columns([
      PlatePart(PlateSection.fill(PlateFill.panel), end: 105),
      PlatePart(PlateSection.plain),
    ]),
    textDirection: TextDirection.rtl,
    borderWidthRatioOverride: 0.04,
    slots: plateRegisterAcross(
      alphabet: PersianAlphabets.digits,
      count: 5,
      left: 114,
      right: 285,
      top: 76,
      height: 58,
    ),
    labels: const [
      PlateLabel(
        text: 'تاریخی',
        box: PlateBox(114, 12, 171, 46),
        glyphHeight: 46,
      ),
    ],
    textGroups: const [
      PlateTextGroup([0, 1, 2, 3, 4], key: 'serial'),
    ],
  );

  /// Motorcycles: three digits (province) upper band; five lower. No letter.
  /// No zeros: after 499 comes 511. `final` not `const` (loops).
  static final PlateSpec motorcycle = PlateSpec(
    id: 'ir.motorcycle',
    country: IranCountry.iran,
    canvasWidth: 175,
    canvasHeight: 110,
    panel: const PlatePanel(
      box: PlateBox(0, 0, 47, 53.7),
      flagScale: 1.0,
      captionScale: 0.25,
      padding: EdgeInsets.fromLTRB(15, 16, 6, 6),
    ),
    // The panel is the top-left corner: a column of the top row.
    background: const PlateSection.rows([
      PlatePart(
        PlateSection.columns([
          PlatePart(PlateSection.fill(PlateFill.panel), end: 47),
          PlatePart(PlateSection.plain),
        ]),
        end: 53.7,
      ),
      PlatePart(PlateSection.plain),
    ]),
    textDirection: TextDirection.rtl,
    borderWidthRatioOverride: 0.05,
    slots: [
      ...plateRegister(
        alphabet: PersianAlphabets.digits,
        count: 3,
        left: 74,
        top: 13,
        width: 22,
        height: 36,
        pitch: 30,
      ),
      ...plateRegister(
        alphabet: PersianAlphabets.digits,
        count: 5,
        left: 8,
        top: 58,
        width: 27,
        height: 44,
        pitch: 33,
      ),
    ],
    textGroups: const [
      PlateTextGroup([0, 1, 2], key: 'province'),
      PlateTextGroup([3, 4, 5, 6, 7], key: 'serial'),
    ],
  );

  /// The blank a plate of this class is printed on. Geometry is *derived* from
  /// usage, the same way `IranThemes.forUsage` derives the colour — a host that
  /// knows it is drawing a taxi asks both and never picks either by hand.
  static PlateSpec forUsage(IranUsage usage) => switch (usage) {
    IranUsage.private => car,
    IranUsage.disabled => disabled,
    IranUsage.taxi => taxi,
    IranUsage.publicTransport => publicTransport,
    IranUsage.agricultural => agricultural,
    IranUsage.government => government,
    IranUsage.temporary => temporary,
    IranUsage.police => police,
    IranUsage.irgc => irgc,
    IranUsage.army => army,
    IranUsage.ministryOfDefence => ministryOfDefence,
    IranUsage.generalStaff => generalStaff,
    IranUsage.political => political,
    IranUsage.service => service,
    IranUsage.protocol => protocol,
    IranUsage.historic => historic,
    IranUsage.motorcycle => motorcycle,
  };

  /// Every Iranian plate this package ships, in [IranUsage] order. What a
  /// gallery walks so that adding a class here shows up there without the app
  /// naming it.
  static List<PlateSpec> get all => <PlateSpec>[
    for (final IranUsage usage in IranUsage.values) forUsage(usage),
  ];
}
