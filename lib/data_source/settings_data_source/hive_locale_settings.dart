import 'dart:io';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cache_service.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:better_one/model/setting_model/notification_setting_model.dart';
import 'package:better_one/model/setting_model/search_setting_model.dart';
import 'package:flutter/material.dart';

class HiveLocaleSettings implements SettingsSource {
  @override
  Future<ResultHandler<Locale, Failure>> changeLanguage(
      Locale newLanguage) async {
    try {
      return ResultHandler.success(
        data: await inject<HiveCache>()
            .appCache
            .put(CacheKeys.lang, newLanguage.languageCode)
            .then((value) => newLanguage),
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
  Future<ResultHandler<ThemeMode, Failure>> toggleTheme() async {
    try {
      var result = await getTheme();
      return result.when(
        success: (currentTheme) async {
          String newTheme = currentTheme == ThemeMode.light
              ? CacheKeys.darkTheme
              : CacheKeys.lightTheme;

          return ResultHandler.success(
            data: await inject<HiveCache>()
                .appCache
                .put(CacheKeys.theme, newTheme)
                .then(
              (value) {
                return ThemeMode.values.byName(newTheme);
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
  Future<ResultHandler<Locale, Failure>> getLanguage() async {
    try {
      return ResultHandler.success(
        data: Locale(inject<HiveCache>()
            .appCache
            .get(CacheKeys.lang, defaultValue: 'en') as String),
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
  Future<ResultHandler<ThemeMode, Failure>> getTheme() async {
    try {
      String theme = inject<HiveCache>().appCache.get(CacheKeys.theme,
          defaultValue: WidgetsBinding
              .instance.platformDispatcher.platformBrightness.name);

      return ResultHandler.success(data: ThemeMode.values.byName(theme));
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
    required SearchSettingModel searchSettings,
  }) async {
    try {
      await inject<HiveCache>()
          .appCache
          .put(CacheKeys.searchSettings, searchSettings.asString());
      return const ResultHandler.success(data: true);
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
  Future<ResultHandler<SearchSettingModel, Failure>> getSearchSettings() async {
    try {
      var searchSettings = SearchSettingModel.fromString(
        inject<HiveCache>().appCache.get(
              CacheKeys.searchSettings,
              defaultValue: const SearchSettingModel().asString(),
            ),
      );
      return ResultHandler.success(data: searchSettings);
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
  Future<ResultHandler<NotificationSettingModel, Failure>>
      getNotificationSettings() async {
    try {
      var notificationSettings = NotificationSettingModel.fromString(
        inject<HiveCache>().appCache.get(
              CacheKeys.notificationSettings,
              defaultValue: const NotificationSettingModel().asString(),
            ),
      );
      return ResultHandler.success(data: notificationSettings);
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
    required NotificationSettingModel notificationSettings,
  }) async {
    try {
      await inject<HiveCache>()
          .appCache
          .put(CacheKeys.notificationSettings, notificationSettings.asString());
      return const ResultHandler.success(data: true);
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
