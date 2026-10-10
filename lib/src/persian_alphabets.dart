import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'iran_usage.dart';

export 'package:plate_alphabet/plate_alphabet.dart' show PersianAlphabets;

/// Which of the [PersianAlphabets] draws the series-letter slot of a plate.
abstract final class IranUsageAlphabets {
  /// The alphabet the series-letter slot of a [usage] plate is drawn over, or
  /// null for a class that carries no letter — [IranUsage.protocol],
  /// [IranUsage.historic] and [IranUsage.motorcycle].
  ///
  /// The lookup is here and not on [IranUsage] so the enum stays free of a
  /// `plate_core` dependency: a usage is a fact about a vehicle, and which
  /// character set draws it is a fact about this rendering of it.
  static PlateAlphabet? forUsage(IranUsage usage) => switch (usage) {
    IranUsage.private => PersianAlphabets.privateLetters,
    IranUsage.disabled => PersianAlphabets.disabledSymbol,
    IranUsage.taxi => PersianAlphabets.taxiLetter,
    IranUsage.publicTransport => PersianAlphabets.publicLetter,
    IranUsage.agricultural => PersianAlphabets.agriculturalLetter,
    IranUsage.government => PersianAlphabets.governmentLetter,
    IranUsage.police => PersianAlphabets.policeLetter,
    IranUsage.irgc => PersianAlphabets.irgcLetter,
    IranUsage.army => PersianAlphabets.armyLetter,
    IranUsage.ministryOfDefence => PersianAlphabets.defenceLetter,
    IranUsage.generalStaff => PersianAlphabets.generalStaffLetter,
    IranUsage.temporary => PersianAlphabets.temporaryLetter,
    IranUsage.political => PersianAlphabets.politicalLetter,
    IranUsage.service => PersianAlphabets.serviceLetter,
    IranUsage.protocol || IranUsage.historic || IranUsage.motorcycle => null,
  };
}
