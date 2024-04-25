import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:flutter/material.dart';

class SettingsCacheByHive implements SettingsCacheInterface {
  SettingsCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<ResultHandler<String, CacheFailure>> changeLanguage(
      String languageCode) async {
    try {
      return ResultHandler.success(
        data: await cacheInit.appBox
            .put(CacheKeys.lang, languageCode)
            .then((value) => languageCode),
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<String, CacheFailure>> toggleTheme() async {
    try {
      var result = await getTheme();
      return result.when(
        success: (currentTheme) async {
          String newTheme = currentTheme == CacheKeys.lightTheme
              ? CacheKeys.darkTheme
              : CacheKeys.lightTheme;

          return ResultHandler.success(
            data: await cacheInit.appBox.put(CacheKeys.theme, newTheme).then(
              (value) {
                return newTheme;
              },
            ),
          );
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<String, CacheFailure>> getLanguage() async {
    try {
      return ResultHandler.success(
        data: cacheInit.appBox.get(CacheKeys.lang, defaultValue: 'en'),
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<String, CacheFailure>> getTheme() async {
    try {
      String theme = cacheInit.appBox.get(CacheKeys.theme,
          defaultValue: WidgetsBinding
              .instance.platformDispatcher.platformBrightness.name);

      return ResultHandler.success(data: theme);
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, CacheFailure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  }) async {
    try {
      var result = await getSearchSettings();
      return result.when(
        success: (settings) {
          cacheInit.appBox.put(CacheKeys.isSearchByTitle,
              isSearchByTitle ?? settings[CacheKeys.isSearchByTitle]);
          cacheInit.appBox.put(CacheKeys.isSearchByBody,
              isSearchByBody ?? settings[CacheKeys.isSearchByBody]);
          cacheInit.appBox.put(CacheKeys.isSearchByDate,
              isSearchByDate ?? settings[CacheKeys.isSearchByDate]);
          cacheInit.appBox.put(CacheKeys.isSearchByStatus,
              isSearchByStatus ?? settings[CacheKeys.isSearchByStatus]);
          return const ResultHandler.success(data: true);
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<Map<String, bool>, CacheFailure>>
      getSearchSettings() async {
    try {
      Map<String, bool> data = {};
      data[CacheKeys.isSearchByTitle] =
          cacheInit.appBox.get(CacheKeys.isSearchByTitle, defaultValue: true);
      data[CacheKeys.isSearchByBody] =
          cacheInit.appBox.get(CacheKeys.isSearchByBody, defaultValue: false);
      data[CacheKeys.isSearchByDate] =
          cacheInit.appBox.get(CacheKeys.isSearchByDate, defaultValue: false);
      data[CacheKeys.isSearchByStatus] =
          cacheInit.appBox.get(CacheKeys.isSearchByStatus, defaultValue: false);
      return ResultHandler.success(data: data);
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<Map<String, dynamic>, CacheFailure>>
      getNotificationSettings() async {
    try {
      Map<String, dynamic> data = {};
      data[CacheKeys.isNotificationOnAdd] = cacheInit.appBox
          .get(CacheKeys.isNotificationOnAdd, defaultValue: true);
      data[CacheKeys.isNotificationOnUpdate] = cacheInit.appBox
          .get(CacheKeys.isNotificationOnUpdate, defaultValue: false);
      data[CacheKeys.isNotificationOnComplete] = cacheInit.appBox
          .get(CacheKeys.isNotificationOnComplete, defaultValue: false);
      data[CacheKeys.isNotificationOnReminder] = cacheInit.appBox
          .get(CacheKeys.isNotificationOnReminder, defaultValue: false);
      data[CacheKeys.reminderDateTime] =
          cacheInit.appBox.get(CacheKeys.reminderDateTime, defaultValue: 0);
      data[CacheKeys.repeatReminder] =
          cacheInit.appBox.get(CacheKeys.repeatReminder, defaultValue: false);
      return ResultHandler.success(data: data);
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, CacheFailure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    int? reminderDateTime,
    bool? repeatReminder,
  }) async {
    try {
      var result = await getNotificationSettings();
      return result.when(
        success: (settings) {
          cacheInit.appBox.put(CacheKeys.isNotificationOnAdd,
              isNotificationOnAdd ?? settings[CacheKeys.isNotificationOnAdd]);
          cacheInit.appBox.put(
              CacheKeys.isNotificationOnUpdate,
              isNotificationOnUpdate ??
                  settings[CacheKeys.isNotificationOnUpdate]);
          cacheInit.appBox.put(
              CacheKeys.isNotificationOnComplete,
              isNotificationOnComplete ??
                  settings[CacheKeys.isNotificationOnComplete]);
          cacheInit.appBox.put(
              CacheKeys.isNotificationOnReminder,
              isNotificationOnReminder ??
                  settings[CacheKeys.isNotificationOnReminder]);
          cacheInit.appBox.put(CacheKeys.reminderDateTime,
              reminderDateTime ?? settings[CacheKeys.reminderDateTime]);
          cacheInit.appBox.put(CacheKeys.repeatReminder,
              repeatReminder ?? settings[CacheKeys.repeatReminder]);
          return const ResultHandler.success(data: true);
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, CacheFailure>> getOnBoardingSeen() async {
    try {
      return ResultHandler.success(
        data:
            cacheInit.appBox.get(CacheKeys.onboardingSeen, defaultValue: false),
      );
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<void, CacheFailure>> setOnBoardingSeen(bool seen) async {
    try {
      await cacheInit.appBox.put(CacheKeys.onboardingSeen, seen);
      return const ResultHandler.success(data: null);
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }
}
