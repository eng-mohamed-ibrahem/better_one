import 'package:easy_localization/easy_localization.dart';

class Validators {
  static const String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'auth.required.pass'.tr();
    } else if (value.length < 8) {
      return 'auth.invalid.pass'.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'auth.required.email'.tr();
    } else if (!RegExp(email).hasMatch(value)) {
      return 'auth.invalid.email'.tr();
    }
    return null;
  }
}
