/// What an Iranian plate is licensed for.
///
/// Iran encodes the vehicle class in **the series letter itself**, not in a
/// separate field: the letter between the leading pair and the serial triple is
/// free (one of thirteen, assigned by county) only on a private plate. On every
/// other class it is fixed for the whole class — a taxi is always `ت`, a police
/// car always `پ`, a government car always `الف`. That is the table under
/// *Letter series* on the Wikipedia article, read as data.
///
/// A closed [enum] is right here where [PlateCountry] and [PlateSpec] are const
/// data classes: the set of Iranian vehicle classes is fixed and owned by the
/// state, not something a consumer of this package extends.
///
/// Usage drives two things and nothing else:
///
/// - the **livery** — `IranThemes.forUsage`, the yellow of a taxi and the green
///   of a police car;
/// - the **series letter** — [seriesLetter], and the [PlateSpec] that carries
///   it, via `IranPlates.forUsage`.
enum IranUsage {
  /// Black on white, letter chosen from the thirteen-letter county series.
  private(seriesLetter: null, latin: null, description: 'Private vehicles'),

  /// Black on white, with the wheelchair symbol ♿︎ where the county letter
  /// would be. The police database records it as `ژ`; the plate prints the
  /// symbol. Issued provincially — `11 ♿︎ 111` upwards to disabled veterans,
  /// `51 ♿︎ 111` upwards to everyone else.
  disabled(
    seriesLetter: 'ژ',
    latin: 'Ž',
    description: 'Private vehicles of people with disabilities',
  ),

  /// Black on yellow, fixed `ت` (for تاکسی) with the Latin word TAXI printed
  /// above it — the one class whose plate carries wording beyond the letter.
  taxi(seriesLetter: 'ت', latin: 'T', description: 'Taxis'),

  /// Black on yellow, fixed `ع` (for عمومی, "public").
  publicTransport(
    seriesLetter: 'ع',
    latin: 'O',
    description: 'Public vehicles',
  ),

  /// Black on yellow, fixed `ک` (for کشاورزی, "agricultural").
  agricultural(
    seriesLetter: 'ک',
    latin: 'K',
    description: 'Agricultural vehicles',
  ),

  /// White on red, fixed `الف` — the first letter of the alphabet spelled out
  /// as a word, which is how it is printed.
  government(
    seriesLetter: 'الف',
    latin: 'A',
    description: 'Government vehicles',
  ),

  /// White on red, and not a series plate at all: `تشریفات` / PROTOCOL beside a
  /// bare number, with no province square and no county letter.
  protocol(seriesLetter: null, latin: null, description: 'Protocol vehicles'),

  /// White on dark green, fixed `پ` (for پلیس). Issued nationally from
  /// provincial code `11` regardless of where the vehicle serves.
  police(
    seriesLetter: 'پ',
    latin: 'P',
    description: 'Police (FARAJA) vehicles',
  ),

  /// White on dark green, fixed `ث`. Also issued nationally from code `11`.
  irgc(
    seriesLetter: 'ث',
    latin: 'Ṯ',
    description: 'Army Police (IRGC) vehicles',
  ),

  /// Black on light brown, fixed `ش`. Issued nationally from code `11`.
  army(
    seriesLetter: 'ش',
    latin: 'Š',
    description: 'Islamic Republic of Iran Army vehicles',
  ),

  /// White on light blue, fixed `ز`. Issued nationally from code `11`.
  ministryOfDefence(
    seriesLetter: 'ز',
    latin: 'Z',
    description: 'Ministry of Defence vehicles',
  ),

  /// White on light blue, fixed `ف`. Issued nationally from code `11`.
  generalStaff(
    seriesLetter: 'ف',
    latin: 'F',
    description: 'General Staff of Armed Forces vehicles',
  ),

  /// Black on cyan, fixed Latin `D`, and the right-hand square reads `سیاسی`
  /// rather than `ایران`. The serial is the three-digit country number.
  political(
    seriesLetter: 'D',
    latin: 'D',
    description: 'Diplomatic and consular corps',
  ),

  /// Black on cyan, fixed Latin `S`, right-hand square `سرویس`. The
  /// international-organisation counterpart of [political].
  service(
    seriesLetter: 'S',
    latin: 'S',
    description: 'Service (international organisations)',
  ),

  /// Black on white, fixed `گ` — the plate a newly built car carries before it
  /// is registered.
  temporary(seriesLetter: 'گ', latin: 'G', description: 'Temporary passage'),

  /// White on brown, and a plate of a different shape entirely: no series
  /// letter, no province square, just `تاریخی` over a five-digit number.
  historic(seriesLetter: null, latin: null, description: 'Historic vehicles'),

  /// Black on white, and the other plate of a different shape: a three-digit
  /// provincial code over a five-digit serial, with no letter at all.
  motorcycle(seriesLetter: null, latin: null, description: 'Motorcycles');

  const IranUsage({
    required this.seriesLetter,
    required this.latin,
    required this.description,
  });

  /// The letter this class is fixed to, in the form the plate stores it, or
  /// null for a class whose letter is free ([private]) or which carries no
  /// letter at all ([protocol], [historic], [motorcycle]).
  ///
  /// [disabled] is `ژ` here rather than `♿︎` deliberately: `ژ` is the stored
  /// character and `♿︎` the printed glyph, which is exactly the
  /// storage-vs-display split `PlateAlphabet.glyphs` exists for.
  final String? seriesLetter;

  /// The Latin equivalent of [seriesLetter] as the article's *Letter series*
  /// table gives it, or null where there is none. Transliteration only — it is
  /// never printed on the plate, except on [political] and [service], where the
  /// Latin letter *is* the series letter.
  final String? latin;

  /// What the class is, in one phrase, for a host that lists plate types.
  final String description;
}
