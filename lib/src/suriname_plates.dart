import 'dart:math';

import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'suriname_country.dart';

/// Where the ink sits, in plate units, on the 300×152 mm canvas.
///
/// NOT MEASURED. The only reference is a 1963 plate (orange on blue, serial
/// `7001-I` beside a stacked year), flattened to 520×110 by the offline stage;
/// it is not the current design, so its rows say nothing about the current
/// one. Every number below is a placeholder: two letters left, four digits
/// right, one row, centred vertically, a 110-unit slot (about 60 units of ink).
/// Recalibrate against a photo of a current plate.
abstract final class _Layout {
  static const double width = 300, height = 152;
  static const double cy = 76, box = 110;
  static const double lettersLeft = 16, lettersWidth = 110;
  static const double digitsLeft = 142, digitsWidth = 142;
}

/// Suriname's current plate: two letters (the first always `P`) and four
/// digits, black on yellow, one row. Groups `letters`, `serial`. Pair with
/// [SurinameThemes.private].
///
/// Not implemented: earlier series such as the 1960s plate.
abstract final class SurinamePlates {
  static final PlateSpec private = PlateSpec(
    id: 'sr.private',
    country: SurinameCountry.suriname,
    canvasWidth: _Layout.width,
    canvasHeight: _Layout.height,
    panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
    noPanel: true,
    slots: <PlateSlot>[
      _field(SurinameAlphabets.letters, 2, _Layout.lettersLeft, _Layout.lettersWidth),
      _field(SurinameAlphabets.digits, 4, _Layout.digitsLeft, _Layout.digitsWidth),
    ],
    textGroups: <PlateTextGroup>[
      PlateTextGroup(<int>[0], key: 'letters'),
      PlateTextGroup(<int>[1], key: 'serial'),
    ],
  );

  static List<PlateSpec> get all => <PlateSpec>[private];

  static PlateSlot _field(PlateAlphabet alphabet, int length, double left, double width) =>
      PlateSlot(
        alphabet: alphabet,
        box: PlateBox(left, _Layout.cy - _Layout.box / 2, width, _Layout.box),
        length: length,
        spacing: max(0, width / length - 0.6 * 0.72 * _Layout.box),
      );
}
