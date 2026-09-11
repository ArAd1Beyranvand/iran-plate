import 'package:flutter/widgets.dart';
import 'package:core_plate/core_plate.dart';

import 'iran_country.dart';
import 'persian_alphabets.dart';

/// The Iranian plate designs.
class IranPlates {
  const IranPlates._();

  /// `final`, not `const`: the digit registers are built by [plateRegister],
  /// and a `const` constructor cannot run a loop. Initialised lazily, once per
  /// isolate; [PlateSpec] equality is over `id` alone, so nothing here depended
  /// on const canonicalisation.
  static final PlateSpec car = PlateSpec(
    id: 'ir.car',
    country: IranCountry.iran,
    canvasWidth: 520,
    canvasHeight: 110,
    panel: const PlatePanel(
      // Overlap the border on the three touching edges (left/top/bottom)
      // instead of sitting flush at the border thickness (0.04 * canvasHeight =
      // 4.4). The panel is clipped back to the rounded plate face by
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
      const PlateSlot(alphabet: PersianAlphabets.plateLetters, box: PlateBox(175, 17, 55, 76)),
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
    labels: const [PlateLabel(text: 'ایران', box: PlateBox(412, 18, 103, 16), glyphHeight: 16)],
    textGroups: const [
      PlateTextGroup([0, 1]),
      PlateTextGroup([2]),
      PlateTextGroup([3, 4, 5]),
      PlateTextGroup([6, 7], prefix: 'IR '),
    ],
  );

  /// `final`, not `const`, for the same reason as [car].
  static final PlateSpec bicycle = PlateSpec(
    id: 'ir.bicycle',
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
      // Bigger left margin than top/bottom: matches a real bicycle plate's
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
  );
}
