import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/repositories/setting_repo/settings_interface.dart';
import 'package:flutter/material.dart';

class SettingRepo implements SettingsRepoInterface {
  @override
  Future<Result<Locale, Failure>> changeLanguage(Locale language) {
    throw UnimplementedError();
  }

  @override
  Future<Result<ThemeData, Failure>> toggleTheme() {
    throw UnimplementedError();
  }
}
