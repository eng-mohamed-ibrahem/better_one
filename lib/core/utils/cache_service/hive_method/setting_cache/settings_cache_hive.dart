import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:flutter/material.dart';

class SettingsCacheHive implements SettingsCacheInterface {
  SettingsCacheHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<Result<Locale, Failure>> changeLanguage(Locale language) {
    throw UnimplementedError();
  }

  @override
  Future<Result<ThemeData, Failure>> toggleTheme() {
    throw UnimplementedError();
  }
}
