import 'package:flutter_common_resources/common_resources.dart';

import '../assets/lang/translations.g.dart';

/// FieldValidators for the app.
abstract final class FieldValidators {
  /// Validates the phone number.
  static String? phone(String? value) {
    if (value.isNullOrEmpty) {
      return t.auth.login.phone_errors.required;
    }
    if (value!.length < 5) {
      return t.auth.login.phone_errors.invalid;
    }
    return null;
  }

  /// Validates the password.
  static String? password(String? value) {
    if (value.isNullOrEmpty) {
      return t.auth.login.password_errors.required;
    }
    if (value!.length < 8) {
      return t.auth.login.password_errors.min_length;
    }
    if (!value.contains(RegExp('[A-Z]'))) {
      return t.auth.login.password_errors.uppercase;
    }
    if (!value.contains(RegExp('[a-z]'))) {
      return t.auth.login.password_errors.lowercase;
    }
    if (!value.contains(RegExp('[0-9]'))) {
      return t.auth.login.password_errors.number;
    }
    return null;
  }

  /// Validates the name.
  static String? name(String? value) {
    if (value.isNullOrEmpty) {
      return t.auth.sign_up.name_errors.required;
    }
    if (value!.length < 2) {
      return t.auth.sign_up.name_errors.min_length;
    }
    return null;
  }

  /// Validates the car plate.
  static String? carPlate(String? value) {
    if (value.isNullOrEmpty) {
      return t.auth.sign_up.car_plate_errors.required;
    }
    if (value!.length < 2) {
      return t.auth.sign_up.car_plate_errors.min_length;
    }
    return null;
  }
}
