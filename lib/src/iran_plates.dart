import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'iran_country.dart';
import 'iran_regions.dart';
import 'iran_themes.dart';
import 'iran_usage.dart';
import 'persian_alphabets.dart';

/// Iranian plate designs. The fourteen civil, military and diplomatic classes
/// are one spec, [civil]: the series letter picks the livery ([IranThemes.civil])
/// and the wording ([_squareCaption], the TAXI label). [protocol], [historic],
/// [motorcycle] are written in full.
abstract final class IranPlates {
  /// The province square's caption: the class's own for the diplomatic
  /// letters, else the region the code and letter locate, else "ایران".
  static String? _squareCaption(String Function(String key) group) =>
      switch (group('letter')) {
        'D' => 'سیاسی',
        'S' => 'سرویس',
        _ => IranRegions.captionOf(group),
      };

  static String? _taxiCaption(String Function(String key) group) =>
      group('letter') == 'ت' ? 'TAXI' : '';

  // Extra space after each digit of a run, so two digits sit at the printed
  // 55-unit pitch (province: 38) instead of the font's own advance.
  static const double _civilSpacing = 22;
  static const double _provinceSpacing = 16;

  /// Every civil, military and diplomatic plate: digit pair, letter, serial
  /// triple, province pair on a 520x110 blank.
  static final PlateSpec civil = PlateSpec(
    id: 'ir.civil',
    country: IranCountry.iran,
    canvasWidth: 520,
    canvasHeight: 110,
    panel: const PlatePanel(box: PlateBox(0, 0, 56.4, 110)),
    textDirection: TextDirection.rtl,
    resolveTheme: IranThemes.civil,
    slots: const [
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(65, 17, 102, 76),
        length: 2,
        spacing: _civilSpacing,
      ),
      PlateSlot(
        alphabet: PersianAlphabets.civilLetters,
        box: PlateBox(172, 17, 61, 76),
      ),
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(238, 17, 157, 76),
        length: 3,
        spacing: _civilSpacing,
      ),
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(428, 40, 70, 52),
        length: 2,
        spacing: _provinceSpacing,
      ),
    ],
    // The panel strip, the serial, then the province square behind a divider
    // at x 404..409 from frame to frame.
    background: const PlateSection.columns([
      PlatePart(PlateSection.fill(PlateFill.panel), end: 56.4),
      PlatePart(PlateSection.plain, end: 406.5, divider: 5),
      PlatePart(PlateSection.plain),
    ]),
    labels: const [
      PlateLabel(
        text: 'ایران',
        box: PlateBox(412, 13, 103, 25.6),
        glyphHeight: 25.6,
        resolve: _squareCaption,
      ),
      // Printed above the letter on a taxi plate only; fades in with `ت`.
      PlateLabel(
        text: '',
        box: PlateBox(175, 12, 55, 14),
        glyphHeight: 12,
        resolve: _taxiCaption,
      ),
    ],
    textGroups: const [
      PlateTextGroup([0], key: 'district'),
      PlateTextGroup([1], key: 'letter'),
      PlateTextGroup([2], key: 'serial'),
      PlateTextGroup([3], prefix: 'IR ', key: 'province'),
    ],
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
    slots: const [
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(294, 16, 203, 76),
        length: 5,
        spacing: 8,
      ),
    ],
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
      PlateTextGroup([0], key: 'serial'),
    ],
  );

  /// Historic vehicles: white on brown, a blue panel left and two rows right —
  /// `تاریخی` over a five-digit serial, split by a horizontal rule. American-
  /// standard blank (300x150), measured from the article's own artwork.
  ///
  /// The panel holds the flag, `I.R. IRAN` and, below them, a framed picture
  /// of Bagh-e Melli. The picture is a photograph, which no box or text can
  /// draw, so it is the one decal here; the frame is part of the image.
  static final PlateSpec historic = PlateSpec(
    id: 'ir.historic',
    country: IranCountry.iran,
    canvasWidth: 300,
    canvasHeight: 150,
    panel: const PlatePanel(
      box: PlateBox(0, 0, 109.6, 68.8),
      flagScale: 1.0,
      captionScale: 0.45,
      padding: EdgeInsets.fromLTRB(7.8, 12, 67.8, 25.8),
    ),
    // The panel, then the two rows behind a vertical rule at x 108.3..110.9;
    // the rows are split by one at y 72.4..75.
    background: const PlateSection.columns([
      PlatePart(PlateSection.fill(PlateFill.panel), end: 109.6, divider: 2.6),
      PlatePart(
        PlateSection.rows([
          PlatePart(PlateSection.plain, end: 73.7, divider: 2.6),
          PlatePart(PlateSection.plain),
        ]),
      ),
    ]),
    textDirection: TextDirection.rtl,
    borderWidthRatioOverride: 0.02,
    slots: const [
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(116.8, 84.5, 168.5, 48),
        length: 5,
        spacing: 13,
      ),
    ],
    labels: const [
      PlateLabel(
        text: 'تاریخی',
        box: PlateBox(114, 18.4, 168, 46),
        glyphHeight: 46,
      ),
    ],
    decals: const [
      PlateDecal(
        image: AssetImage(
          'assets/historic_bagh_e_melli.png',
          package: 'iran_plate',
        ),
        box: PlateBox(9.4, 68.8, 92.7, 70.3),
      ),
    ],
    textGroups: const [
      PlateTextGroup([0], key: 'serial'),
    ],
  );

  /// Motorcycles: a three-digit code over a five-digit serial, on a blue panel
  /// in the top-left corner. No letter. No zeros: after 499 comes 511.
  /// Positions are measured from the article's artwork (`Pelak melie motor`).
  static final PlateSpec motorcycle = PlateSpec(
    id: 'ir.motorcycle',
    country: IranCountry.iran,
    canvasWidth: 175,
    canvasHeight: 110,
    panel: const PlatePanel(
      box: PlateBox(0, 0, 36.7, 58.4),
      flagScale: 1.0,
      captionScale: 0.5,
      padding: EdgeInsets.fromLTRB(5.5, 5.4, 2.7, 3.4),
    ),
    // The panel is the top-left corner: a column of the top row.
    background: const PlateSection.rows([
      PlatePart(
        PlateSection.columns([
          PlatePart(PlateSection.fill(PlateFill.panel), end: 36.7),
          PlatePart(PlateSection.plain),
        ]),
        end: 58.4,
      ),
      PlatePart(PlateSection.plain),
    ]),
    textDirection: TextDirection.rtl,
    borderWidthRatioOverride: 0.05,
    slots: const [
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(63.1, 9.3, 79.8, 40),
        length: 3,
        spacing: 9.4,
      ),
      PlateSlot(
        alphabet: PersianAlphabets.digits,
        box: PlateBox(8.5, 63.3, 151.5, 40),
        length: 5,
        spacing: 13,
      ),
    ],
    textGroups: const [
      PlateTextGroup([0], key: 'province'),
      PlateTextGroup([1], key: 'serial'),
    ],
  );

  /// The blank a plate of this class is printed on. Geometry is *derived* from
  /// usage. Every civil class shares [civil], whose colour follows its letter.
  static PlateSpec forUsage(IranUsage usage) => switch (usage) {
    IranUsage.protocol => protocol,
    IranUsage.historic => historic,
    IranUsage.motorcycle => motorcycle,
    _ => civil,
  };

  /// Every Iranian plate this package ships, in [IranUsage] order. What a
  /// gallery walks so that adding a class here shows up there without the app
  /// naming it.
  static List<PlateSpec> get all => <PlateSpec>[
    civil,
    protocol,
    historic,
    motorcycle,
  ];
}
