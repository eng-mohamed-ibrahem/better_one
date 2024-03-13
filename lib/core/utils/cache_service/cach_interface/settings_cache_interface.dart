import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';

abstract class SettingsCacheInterface {
  /// toggle theme light or dark
  Future<Result<String, CacheFailure>> toggleTheme();

  /// get current theme
  Future<Result<String, CacheFailure>> getTheme();

  /// change language in app
  Future<Result<String, CacheFailure>> changeLanguage(String languageCode);

  /// get current language
  Future<Result<String, CacheFailure>> getLanguage();

  // set search settings
  Future<Result<bool, CacheFailure>> setSearchSettings({
    bool? isSearchByTitle,
    bool? isSearchByBody,
    bool? isSearchByDate,
    bool? isSearchByStatus,
  });

  // get search settings
  Future<Result<Map<String, bool>, CacheFailure>> getSearchSettings();
}
