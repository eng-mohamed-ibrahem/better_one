import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepoInterface {
  // change language, return new language
  Future<Result<Locale, Failure>> changeLanguage(Locale language);

  // toggle theme between light and dark and return new theme
  Future<Result<ThemeData, Failure>> toggleTheme();
}
