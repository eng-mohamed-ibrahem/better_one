import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepoInterface {
  // change language, return new language
  Future<Result<Locale, Failure>> changeLanguage(Locale language);

  // get current language
  Future<Result<Locale, Failure>> getLanguage();

  // toggle theme between light and dark and return new theme
  Future<Result<ThemeMode, Failure>> toggleTheme();

  // get current theme
  Future<Result<ThemeMode, Failure>> getTheme();

  // set search settings
  Future<Result<bool, Failure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  });

  // get search settings
  Future<Result<Map<String, bool>, Failure>> getSearchSettings();

  // get notification settings
  Future<Result<Map<String, dynamic>, Failure>> getNotificationSettings();

  // set notification settings
  Future<Result<bool, Failure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    DateTime? reminderDateTime,
    bool? repeatReminder,
  });
}
