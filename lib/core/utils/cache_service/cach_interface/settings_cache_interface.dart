import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:flutter/material.dart';

abstract class SettingsCacheInterface {
  /// toggle theme light or dark
  Future<Result<ThemeData, Failure>> toggleTheme();

  /// change language in app
  Future<Result<Locale, Failure>> changeLanguage(Locale language);
}
