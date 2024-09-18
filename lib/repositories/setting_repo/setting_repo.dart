import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:better_one/model/setting_model/notification_setting_model.dart';
import 'package:better_one/model/setting_model/search_setting_model.dart';
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
    required SearchSettingModel searchSettings,
  }) async {
    return await settingsSource.setSearchSettings(
      searchSettings: searchSettings,
    );
  }

  @override
  Future<ResultHandler<SearchSettingModel, Failure>> getSearchSettings() async {
    return await settingsSource.getSearchSettings();
  }

  @override
  Future<ResultHandler<NotificationSettingModel, Failure>>
      getNotificationSettings() async {
    return await settingsSource.getNotificationSettings();
  }

  @override
  Future<ResultHandler<bool, Failure>> setNotificationSettings({
    required NotificationSettingModel notificationSettings,
  }) async {
    return await settingsSource.setNotificationSettings(
      notificationSettings: notificationSettings,
    );
  }
}
