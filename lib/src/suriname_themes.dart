import 'package:plate_core/plate_core.dart';

import 'suriname_colors.dart';

/// Black on yellow. The border width and corner radius are not measured.
abstract final class SurinameThemes {
  static final PlateTheme private = PlateTheme.monochrome(
    field: SurinameColors.yellow,
    ink: SurinameColors.black,
    inactive: SurinameColors.inactive,
    borderWidthRatio: 0.02,
    plateRadiusRatio: 0.04,
  );
}
