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
  Future<Result<ThemeMode, Failure>> toggleTheme() {
    return settingsSource.toggleTheme();
  }

  @override
  Future<Result<Locale, Failure>> getLanguage() {
    return settingsSource.getLanguage();
  }

  @override
  Future<Result<ThemeMode, Failure>> getTheme() {
    return settingsSource.getTheme();
  }

  @override
  Future<Result<bool, Failure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  }) {
    return settingsSource.setSearchSettings(
      isSearchByTitle: isSearchByTitle,
      isSearchByBody: isSearchByBody,
      isSearchByDate: isSearchByDate,
      isSearchByStatus: isSearchByStatus,
    );
  }

  @override
  Future<Result<Map<String, bool>, Failure>> getSearchSettings() {
    return settingsSource.getSearchSettings();
  }

  @override
  Future<Result<Map<String, dynamic>, Failure>> getNotificationSettings() {
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, Failure>> setNotificationSettings(
      {bool? isNotificationOnAdd,
      bool? isNotificationOnUpdate,
      bool? isNotificationOnComplete,
      bool? isNotificationOnReminder,
      DateTime? reminderDateTime}) {
    throw UnimplementedError();
  }
}
