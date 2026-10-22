import 'package:plate_core/plate_core.dart';

/// Judges a plate: two letters, the first always `P`, and four digits
/// (`PA 1234`). Reports, never bars a keystroke.
class SurinameValidator extends GatedPlateValidator {
  const SurinameValidator();

  static final RegExp _letters = RegExp(r'^P[A-Z]$');

  @override
  String get gateGroup => 'serial';

  static const String reasonLetters = 'The register is two letters, the first one P.';
  static const String reasonSerial = 'The number is four digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_letters.hasMatch(entry.group('letters'))) {
      return const PlateValidation.invalid(reasonLetters);
    }
    if (!isDigitsOfLength(entry.group('serial'), 4)) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
