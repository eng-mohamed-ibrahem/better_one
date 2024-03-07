import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/settings_data_source/settings_source_interface.dart';
import 'package:flutter/material.dart';

import '../../core/utils/cache_service/cache_service.dart';

class LocalSettingsDataSource implements SettingsSource {
  LocalSettingsDataSource(this.settingsCache);
  final SettingsCacheInterface settingsCache;

  @override
  Future<Result<Locale, CacheFailure>> changeLanguage(Locale language) {
    settingsCache.changeLanguage(language);
    throw UnimplementedError();
  }

  @override
  Future<Result<ThemeData, CacheFailure>> toggleTheme() {
    throw UnimplementedError();
  }
}
