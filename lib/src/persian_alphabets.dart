import 'package:flutter/widgets.dart';
import 'package:core_plate/core_plate.dart';

/// The Persian alphabets a plate slot can be drawn over.
class PersianAlphabets {
  const PersianAlphabets._();

  static const PlateAlphabet digits = PlateAlphabet(
    id: 'fa.digits',
    characters: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    input: AlphabetInput.typed,
    isNumeric: true,
    glyphs: {'0': '۰', '1': '۱', '2': '۲', '3': '۳', '4': '۴', '5': '۵', '6': '۶', '7': '۷', '8': '۸', '9': '۹'},
  );

  static const PlateAlphabet plateLetters = PlateAlphabet(
    id: 'fa.plateLetters',
    characters: ['ب', 'ح', 'د', 'س', 'ص', 'ط', 'ق', 'ل', 'م', 'ن', 'و', 'ه', 'ی', 'ت', 'ژ', 'گ'],
    input: AlphabetInput.chosen,
    isNumeric: false,
    direction: TextDirection.rtl,
    placeholder: '؟',
  );
}
