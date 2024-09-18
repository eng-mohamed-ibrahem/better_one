import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/setting_model/notification_setting_model.dart';
import 'package:better_one/model/setting_model/search_setting_model.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepoInterface {
  // change language, return new language
  Future<ResultHandler<Locale, Failure>> changeLanguage(Locale language);

  // get current language
  Future<ResultHandler<Locale, Failure>> getLanguage();

  // toggle theme between light and dark and return new theme
  Future<ResultHandler<ThemeMode, Failure>> toggleTheme();

  // get current theme
  Future<ResultHandler<ThemeMode, Failure>> getTheme();

  // set search settings
  Future<ResultHandler<bool, Failure>> setSearchSettings({
    required SearchSettingModel searchSettings,
  });

  // get search settings
  Future<ResultHandler<SearchSettingModel, Failure>> getSearchSettings();

  // get notification settings
  Future<ResultHandler<NotificationSettingModel, Failure>>
      getNotificationSettings();

  // set notification settings
  Future<ResultHandler<bool, Failure>> setNotificationSettings({
    required NotificationSettingModel notificationSettings,
  });
}
