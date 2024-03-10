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
}
