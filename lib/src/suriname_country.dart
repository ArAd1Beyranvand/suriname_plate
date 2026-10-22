import 'package:plate_core/plate_core.dart';

import 'suriname_colors.dart';

/// Suriname as a `PlateCountry`. The plate carries no country block, so every
/// spec sets `noPanel`. The national flag appears on the article page only,
/// not on the plate, so none is drawn.
abstract final class SurinameCountry {
  static const PlateCountry suriname = PlateCountry(
    code: 'sr',
    captionLines: <String>[],
    panelColor: SurinameColors.yellow,
    panelTextColor: SurinameColors.black,
  );
}
