import 'dart:io';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:flutter/material.dart';

class SettingsCacheByHive implements SettingsCacheInterface {
  SettingsCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<ResultHandler<String, Failure>> changeLanguage(
      String languageCode) async {
    try {
      return ResultHandler.success(
        data: await cacheInit.appBox
            .put(CacheKeys.lang, languageCode)
            .then((value) => languageCode),
      );
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<String, Failure>> toggleTheme() async {
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
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<String, Failure>> getLanguage() async {
    try {
      return ResultHandler.success(
        data: cacheInit.appBox.get(CacheKeys.lang, defaultValue: 'en'),
      );
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<String, Failure>> getTheme() async {
    try {
      String theme = cacheInit.appBox.get(CacheKeys.theme,
          defaultValue: WidgetsBinding
              .instance.platformDispatcher.platformBrightness.name);

      return ResultHandler.success(data: theme);
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
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
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<Map<String, bool>, Failure>> getSearchSettings() async {
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
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<Map<String, dynamic>, Failure>>
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
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> setNotificationSettings({
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
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> getOnBoardingSeen() async {
    try {
      return ResultHandler.success(
        data:
            cacheInit.appBox.get(CacheKeys.onboardingSeen, defaultValue: false),
      );
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<void, Failure>> setOnBoardingSeen(bool seen) async {
    try {
      await cacheInit.appBox.put(CacheKeys.onboardingSeen, seen);
      return const ResultHandler.success(data: null);
    } on FileSystemException catch (e) {
      return ResultHandler.failure(
        error: CacheFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }
}
