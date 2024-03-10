import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:better_one/repositories/setting_repo/settings_interface.dart';
import 'package:flutter/material.dart';

class SettingRepo implements SettingsRepoInterface {
  SettingRepo({required this.settingsSource});
  final SettingsSource settingsSource;
  @override
  Future<Result<Locale, Failure>> changeLanguage(Locale language) {
    return settingsSource.changeLanguage(language);
  }

  @override
  Future<Result<ThemeData, Failure>> toggleTheme() {
    return settingsSource.toggleTheme();
  }

  @override
  Future<Result<Locale, Failure>> getLanguage() {
    return settingsSource.getLanguage();
  }

  @override
  Future<Result<ThemeData, Failure>> getTheme() {
    return settingsSource.getTheme();
  }
}
