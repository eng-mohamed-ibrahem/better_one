import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
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
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  });

  // get search settings
  Future<ResultHandler<Map<String, bool>, Failure>> getSearchSettings();

  // get notification settings
  Future<ResultHandler<Map<String, dynamic>, Failure>>
      getNotificationSettings();

  // set notification settings
  Future<ResultHandler<bool, Failure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    DateTime? reminderDateTime,
    bool? repeatReminder,
  });

  // set onborading seen
  Future<ResultHandler<void, Failure>> setOnBoardingSeen(bool seen);

  // get onborading seen
  Future<ResultHandler<bool, Failure>> getOnBoardingSeen();
}
