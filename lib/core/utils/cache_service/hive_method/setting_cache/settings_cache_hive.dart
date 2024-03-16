import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

import '../../../../constants/constants.dart';

class SettingsCacheByHive implements SettingsCacheInterface {
  SettingsCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<Result<String, CacheFailure>> changeLanguage(
      String languageCode) async {
    try {
      return Result.success(
        data: await cacheInit.appBox
            .put(CacheKeys.lang, languageCode)
            .then((value) => languageCode),
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String, CacheFailure>> toggleTheme() async {
    try {
      String theme = cacheInit.appBox
          .get(CacheKeys.theme, defaultValue: CacheKeys.lightTheme);
      if (theme == CacheKeys.darkTheme) {
        theme = CacheKeys.lightTheme;
      } else {
        theme = CacheKeys.darkTheme;
      }
      return Result.success(
        data: await cacheInit.appBox.put(CacheKeys.theme, theme).then(
          (value) {
            return theme;
          },
        ),
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String, CacheFailure>> getLanguage() async {
    try {
      return Result.success(
        data: cacheInit.appBox.get(CacheKeys.lang, defaultValue: 'en'),
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<String, CacheFailure>> getTheme() async {
    try {
      String theme = cacheInit.appBox
          .get(CacheKeys.theme, defaultValue: CacheKeys.lightTheme);

      return Result.success(data: theme);
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<bool, CacheFailure>> setSearchSettings({
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
          return const Result.success(data: true);
        },
        failure: (failure) {
          return Result.failure(error: failure);
        },
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Map<String, bool>, CacheFailure>> getSearchSettings() async {
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
      return Result.success(data: data);
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Map<String, dynamic>, CacheFailure>>
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
      return Result.success(data: data);
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<bool, CacheFailure>> setNotificationSettings({
    bool? isNotificationOnAdd,
    bool? isNotificationOnUpdate,
    bool? isNotificationOnComplete,
    bool? isNotificationOnReminder,
    int? reminderDateTime,
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
          return const Result.success(data: true);
        },
        failure: (failure) {
          return Result.failure(error: failure);
        },
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }
}
