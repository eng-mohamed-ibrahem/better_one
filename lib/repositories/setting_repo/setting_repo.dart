import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:better_one/repositories/setting_repo/settings_repo_interface.dart';
import 'package:flutter/material.dart';

class SettingRepo implements SettingsRepoInterface {
  SettingRepo({required this.settingsSource});
  final SettingsSource settingsSource;
  @override
  Future<ResultHandler<Locale, Failure>> changeLanguage(Locale language) async {
    return await settingsSource.changeLanguage(language);
  }

  @override
  Future<ResultHandler<ThemeMode, Failure>> toggleTheme() async {
    return await settingsSource.toggleTheme();
  }

  @override
  Future<ResultHandler<Locale, Failure>> getLanguage() async {
    return await settingsSource.getLanguage();
  }

  @override
  Future<ResultHandler<ThemeMode, Failure>> getTheme() async {
    return await settingsSource.getTheme();
  }

  @override
  Future<ResultHandler<bool, Failure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  }) async {
    return await settingsSource.setSearchSettings(
      isSearchByTitle: isSearchByTitle,
      isSearchByBody: isSearchByBody,
      isSearchByDate: isSearchByDate,
      isSearchByStatus: isSearchByStatus,
    );
  }

  @override
  Future<ResultHandler<Map<String, bool>, Failure>> getSearchSettings() async {
    return await settingsSource.getSearchSettings();
  }

  @override
  Future<ResultHandler<Map<String, dynamic>, Failure>>
      getNotificationSettings() async {
    return await settingsSource.getNotificationSettings();
  }

  @override
  Future<ResultHandler<bool, Failure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    DateTime? reminderDateTime,
    bool? repeatReminder,
  }) async {
    return await settingsSource.setNotificationSettings(
      isNotificationOnAdd: isNotificationOnAdd,
      isNotificationOnUpdate: isNotificationOnUpdate,
      isNotificationOnComplete: isNotificationOnComplete,
      isNotificationOnReminder: isNotificationOnReminder,
      reminderDateTime: reminderDateTime,
      repeatReminder: repeatReminder,
    );
  }

  @override
  Future<ResultHandler<void, Failure>> setOnBoardingSeen(bool seen) async {
    return await settingsSource.setOnBoardingSeen(seen);
  }

  @override
  Future<ResultHandler<bool, Failure>> getOnBoardingSeen() async {
    return await settingsSource.getOnBoardingSeen();
  }
}
