import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/cache_service/cache_service.dart';

class LocalSettingsDataSource implements SettingsSource {
  LocalSettingsDataSource({required this.settingsCache});
  final SettingsCacheInterface settingsCache;

  @override
  Future<Result<Locale, Failure>> changeLanguage(Locale newLanguage) async {
    try {
      var result = await settingsCache.changeLanguage(newLanguage.languageCode);
      return result.when(success: (data) {
        return Result.success(data: Locale(data));
      }, failure: (error) {
        return Result.failure(error: error);
      });
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<ThemeData, Failure>> toggleTheme() async {
    try {
      var result = await settingsCache.toggleTheme();
      return result.when(success: (currentTheme) {
        return Result.success(
          data: currentTheme == CacheKeys.lightTheme
              ? ThemeData.light()
              : ThemeData.dark(),
        );
      }, failure: (error) {
        return Result.failure(error: error);
      });
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<Locale, Failure>> getLanguage() async {
    try {
      var result = await settingsCache.getLanguage();
      return result.when(
        success: (data) {
          return Result.success(data: Locale(data));
        },
        failure: (error) {
          return Result.failure(error: error);
        },
      );
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<ThemeData, Failure>> getTheme() async {
    try {
      var result = await settingsCache.getTheme();
      return result.when(
        success: (data) {
          return Result.success(
            data: data == CacheKeys.lightTheme
                ? ThemeData.light()
                : ThemeData.dark(),
          );
        },
        failure: (error) {
          return Result.failure(error: error);
        },
      );
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
