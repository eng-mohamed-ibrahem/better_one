import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

class UserCacheByHive implements UserCacheInterface {
  UserCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<Result<Map<String, dynamic>, CacheFailure>>
      getUserDataFromLocal() async {
    try {
      return Result.success(data: cacheInit.appBox.get(CacheKeys.user));
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<bool, CacheFailure>> setUserDataToLocal(
      {required Map<String, dynamic> user}) async {
    try {
      await cacheInit.appBox.put(CacheKeys.user, user);
      return const Result.success(data: true);
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }
}
