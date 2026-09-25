import 'package:flutter/widgets.dart';
import 'package:core_plate/core_plate.dart';

import 'iran_country.dart';
import 'iran_usage.dart';
import 'persian_alphabets.dart';

/// The Iranian plate designs.
///
/// ## One geometry, many liveries
///
/// Almost every Iranian plate is the same 520×110 blank: a country panel, a
/// leading digit pair, a series letter, a serial triple, a full-height divider
/// and the two-digit province square under `ایران`. A taxi plate is not a
/// different design from a private one — it is that design in yellow with `ت`
/// fixed in the letter slot and the word TAXI printed above it.
///
/// So the classes below share [_standard], which is the one place those
/// coordinates are written down. What varies between them is data: which
/// alphabet the letter slot is drawn over, how wide that slot has to be for the
/// character it holds, whatever extra wording the class prints, and what the
/// right-hand square is captioned. Colour is *not* among them — that lives in
/// `IranThemes`, keyed by the same [IranUsage].
///
/// [protocol], [historic] and [motorcycle] are genuinely different blanks and
/// are written out in full.
abstract final class IranPlates {
  // --- The shared 520x110 blank ---------------------------------------------

  /// The leading digit pair, the serial triple and the province pair — every
  /// register the standard blank has, in the positions measured off the
  /// reference SVGs on the Wikipedia article. Only the letter between the pair
  /// and the triple varies by class, so only it is a parameter.
  ///
  /// `final`, not `const`: the digit registers are built by [plateRegister],
  /// and a `const` constructor cannot run a loop. [PlateSpec] equality is over
  /// `id` alone, so nothing here depended on const canonicalisation.
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
      panel: const PlatePanel(
        // Overlap the border on the three touching edges (left/top/bottom)
        // instead of sitting flush at the border thickness (0.04 * canvasHeight
        // = 4.4). The panel is clipped back to the rounded plate face by
        // _PlateFaceClipper, so extending it under the frame just makes the blue
        // paint right up to the clip boundary — killing the thin white seam that
        // a flush edge leaves when the FittedBox scale lands the panel edge and
        // the border edge on different physical pixels. Right edge (56.4) stays
        // interior and is unchanged.
        box: PlateBox(0, 0, 56.4, 110),
      ),
      textDirection: TextDirection.rtl,
      slots: [
        // The leading pair and the serial triple share a pitch of 55 but not a
        // run: the letter sits between them, on its own wider box. Three
        // registers, not one — the gaps are where the letter and the province
        // divider go.
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
        // The province pair, past the divider: smaller cells, lower and on their
        // own pitch.
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
      rules: const [
        // The province divider runs the full height of the plate face (top edge
        // to bottom edge), meeting the border at both ends — no empty gaps.
        PlateRule(box: PlateBox(404, 4.4, 5, 101.2)),
      ],
      labels: [
        PlateLabel(text: squareCaption, box: const PlateBox(412, 18, 103, 16), glyphHeight: 16),
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

  /// Private cars: black on white, with the series letter chosen from the
  /// thirteen-letter county series. The plate the infobox on the article shows,
  /// and the one every other 520×110 class below is a variation of.
  static final PlateSpec car = _standard(id: 'ir.car', letter: PersianAlphabets.privateLetters);

  /// Private cars of people with disabilities: black on white, with the
  /// wheelchair symbol ♿︎ fixed where the county letter would be.
  ///
  /// The slot is wider and a shade taller than the standard one (66 against 55)
  /// because the symbol is: on the reference SVG it spans 79 units of plate
  /// width against a letter's 55, and squeezing it into the letter box would
  /// letterbox the only thing that distinguishes the plate.
  static final PlateSpec disabled = _standard(
    id: 'ir.disabled',
    letter: PersianAlphabets.disabledSymbol,
    letterBox: const PlateBox(170, 16, 66, 77),
  );

  /// Taxis: black on yellow, `ت` fixed, and the Latin word TAXI printed above
  /// it — the only Iranian class that prints wording beside its letter.
  ///
  /// The letter slot drops to the lower band (top 41 rather than 17) to make
  /// room, exactly as the reference SVG does: there the `ت` occupies y 48–93
  /// and TAXI y 16–37, against a private plate's letter at y 16–87.
  static final PlateSpec taxi = _standard(
    id: 'ir.taxi',
    letter: PersianAlphabets.taxiLetter,
    letterBox: const PlateBox(175, 41, 55, 52),
    extraLabels: const [PlateLabel(text: 'TAXI', box: PlateBox(158, 12, 89, 26), glyphHeight: 26)],
  );

  /// Public transport: black on yellow, `ع` fixed (for عمومی).
  static final PlateSpec publicTransport = _standard(id: 'ir.public', letter: PersianAlphabets.publicLetter);

  /// Agricultural vehicles: black on yellow, `ک` fixed (for کشاورزی).
  static final PlateSpec agricultural = _standard(id: 'ir.agricultural', letter: PersianAlphabets.agriculturalLetter);

  /// Government vehicles: white on red, `الف` fixed.
  ///
  /// A wider letter box than the standard 55: `الف` is a three-letterform word,
  /// not a single character, and prints about as wide as the wheelchair symbol.
  static final PlateSpec government = _standard(
    id: 'ir.government',
    letter: PersianAlphabets.governmentLetter,
    letterBox: const PlateBox(168, 17, 70, 76),
  );

  /// Temporary passage: black on white, `گ` fixed — the plate a newly built car
  /// wears before it is registered.
  static final PlateSpec temporary = _standard(id: 'ir.temporary', letter: PersianAlphabets.temporaryLetter);

  // --- Military and law enforcement -----------------------------------------
  //
  // All four schemes below are issued nationally from provincial code 11
  // regardless of where the vehicle serves, so the province square is not a
  // province on these plates. That is a fact about the value, not the geometry,
  // and the blank is unchanged.

  /// Police (FARAJA): white on dark green, `پ` fixed (for پلیس).
  static final PlateSpec police = _standard(id: 'ir.police', letter: PersianAlphabets.policeLetter);

  /// Army Police (IRGC): white on dark green, `ث` fixed.
  static final PlateSpec irgc = _standard(id: 'ir.irgc', letter: PersianAlphabets.irgcLetter);

  /// Islamic Republic of Iran Army: black on light brown, `ش` fixed.
  static final PlateSpec army = _standard(id: 'ir.army', letter: PersianAlphabets.armyLetter);

  /// Ministry of Defence and Armed Forces Logistics: white on light blue, `ز`
  /// fixed.
  static final PlateSpec ministryOfDefence = _standard(id: 'ir.defence', letter: PersianAlphabets.defenceLetter);

  /// General Staff of the Armed Forces: white on light blue, `ف` fixed.
  static final PlateSpec generalStaff = _standard(id: 'ir.generalStaff', letter: PersianAlphabets.generalStaffLetter);

  // --- Political and service ------------------------------------------------

  /// Diplomatic and consular corps: black on cyan, Latin `D` fixed, and the
  /// right-hand square captioned `سیاسی` rather than `ایران`.
  ///
  /// The serial triple is the country's assigned number (365 in the reference
  /// image; 214 is Germany), and the leading pair counts embassies within that
  /// country — 11D, 12D and so on.
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
      PlateLabel(text: 'تشریفات', box: PlateBox(63, 4, 221, 52), glyphHeight: 48),
      PlateLabel(text: 'PROTOCOL', box: PlateBox(63, 56, 221, 42), glyphHeight: 42),
    ],
    textGroups: const [
      PlateTextGroup([0, 1, 2, 3, 4], key: 'serial'),
    ],
  );

  /// Historic vehicles — museum pieces and older significant cars: white on
  /// brown, `تاریخی` over a five-digit number, on the American-standard blank
  /// rather than the European one.
  ///
  /// **The Bagh-e Melli photograph is not drawn.** The real plate prints the
  /// Tehran gate under the flag in the left-hand block; this package ships no
  /// such image, and inventing one would be worse than leaving the block as the
  /// ordinary flag-and-caption panel. Everything else — the field, the wording
  /// and the serial — is the plate.
  ///
  /// Geometry `// CALIBRATE`: read off `Pelak melie tarikhi.png` by eye rather
  /// than measured off a vector source, which is all the article offers for
  /// this class.
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
    labels: const [PlateLabel(text: 'تاریخی', box: PlateBox(114, 12, 171, 46), glyphHeight: 46)],
    textGroups: const [
      PlateTextGroup([0, 1, 2, 3, 4], key: 'serial'),
    ],
  );

  /// Motorcycles: a three-digit provincial code in the upper band beside the
  /// panel, and a five-digit serial across the full width below it. No series
  /// letter at all, and neither register may contain a zero — after code `499`
  /// comes `511`.
  ///
  /// `final`, not `const`, for the same reason as [car].
  static final PlateSpec motorcycle = PlateSpec(
    id: 'ir.motorcycle',
    country: IranCountry.iran,
    canvasWidth: 175,
    canvasHeight: 110,
    panel: const PlatePanel(
      // Overlap the border on the two touching edges (left/top) instead of
      // sitting flush at the border thickness (0.05 * canvasHeight = 5.5); the
      // panel is clipped back to the plate face, so this kills the thin white
      // seam a flush edge leaves. See car. Right (63.7) and bottom (53.7)
      // edges are interior and unchanged.
      //
      // Panel width is sized to wrap the flag (the widest element) plus the
      // left/right margins below, instead of a slack fraction: flagScale is 1.0
      // so the flag fills its box exactly and panelWidth = padding + flag
      // width.
      box: PlateBox(0, 0, 47, 53.7),
      flagScale: 1.0,
      captionScale: 0.25,
      // Bigger left margin than top/bottom: matches a real motorcycle plate's
      // panel, where the flag+caption block sits clear of the frame on the
      // left but only needs breathing room, not a deep inset, top and bottom.
      // Extra margin all around keeps the smaller flag/caption clear of the
      // panel edges instead of crowding the blue block.
      padding: EdgeInsets.fromLTRB(15, 16, 6, 6),
    ),
    textDirection: TextDirection.rtl,
    borderWidthRatioOverride: 0.05,
    slots: [
      // Upper band: three digits beside the panel, at pitch 30.
      ...plateRegister(
        alphabet: PersianAlphabets.digits,
        count: 3,
        left: 74,
        top: 13,
        width: 22,
        height: 36,
        pitch: 30,
      ),
      // Lower band: five bigger digits across the full width, at pitch 33.
      ...plateRegister(alphabet: PersianAlphabets.digits, count: 5, left: 8, top: 58, width: 27, height: 44, pitch: 33),
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
  static List<PlateSpec> get all => <PlateSpec>[for (final IranUsage usage in IranUsage.values) forUsage(usage)];
}
