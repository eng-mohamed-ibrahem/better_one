import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/cache_service/cache_service.dart';

class LocalSettingsDataSource implements SettingsSource {
  LocalSettingsDataSource({required this.settingsCache});
  final SettingsCacheInterface settingsCache;

  @override
  Future<ResultHandler<Locale, Failure>> changeLanguage(
      Locale newLanguage) async {
    try {
      var result = await settingsCache.changeLanguage(newLanguage.languageCode);
      return result.when(success: (data) {
        return ResultHandler.success(data: Locale(data));
      }, failure: (error) {
        return ResultHandler.failure(error: error);
      });
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<ThemeMode, Failure>> toggleTheme() async {
    try {
      var result = await settingsCache.toggleTheme();
      return result.when(
        success: (currentTheme) {
          return ResultHandler.success(
            data: currentTheme == CacheKeys.lightTheme
                ? ThemeMode.light
                : ThemeMode.dark,
          );
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<Locale, Failure>> getLanguage() async {
    try {
      var result = await settingsCache.getLanguage();
      return result.when(
        success: (data) {
          return ResultHandler.success(data: Locale(data));
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<ThemeMode, Failure>> getTheme() async {
    try {
      var result = await settingsCache.getTheme();
      return result.when(
        success: (data) {
          return ResultHandler.success(
            data:
                data == CacheKeys.lightTheme ? ThemeMode.light : ThemeMode.dark,
          );
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  }) async {
    try {
      return await settingsCache.setSearchSettings(
        isSearchByTitle: isSearchByTitle,
        isSearchByBody: isSearchByBody,
        isSearchByDate: isSearchByDate,
        isSearchByStatus: isSearchByStatus,
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<Map<String, bool>, Failure>> getSearchSettings() async {
    try {
      return await settingsCache.getSearchSettings();
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<Map<String, dynamic>, Failure>>
      getNotificationSettings() async {
    try {
      var result = await settingsCache.getNotificationSettings();
      return result.when(
        success: (data) {
          data[CacheKeys.reminderDateTime] =
              data[CacheKeys.reminderDateTime] == 0
                  ? null
                  : DateTime.fromMicrosecondsSinceEpoch(
                      data[CacheKeys.reminderDateTime]);
          return ResultHandler.success(data: data);
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
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
    try {
      return await settingsCache.setNotificationSettings(
        isNotificationOnAdd: isNotificationOnAdd,
        isNotificationOnUpdate: isNotificationOnUpdate,
        isNotificationOnComplete: isNotificationOnComplete,
        isNotificationOnReminder: isNotificationOnReminder,
        reminderDateTime: reminderDateTime?.microsecondsSinceEpoch,
        repeatReminder: repeatReminder,
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<void, Failure>> setOnBoardingSeen(bool seen) async {
    try {
      return await settingsCache.setOnBoardingSeen(seen);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> getOnBoardingSeen() async {
    try {
      return await settingsCache.getOnBoardingSeen();
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
