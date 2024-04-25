import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

class UserCacheByHive implements UserCacheInterface {
  UserCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<ResultHandler<Map<String, dynamic>, CacheFailure>>
      getUserDataFromLocal() async {
    try {
      return ResultHandler.success(data: cacheInit.appBox.get(CacheKeys.user));
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, CacheFailure>> setUserDataToLocal(
      {required Map<String, dynamic> user}) async {
    try {
      await cacheInit.appBox.put(CacheKeys.user, user);
      return const ResultHandler.success(data: true);
    } catch (e) {
      return ResultHandler.failure(error: CacheFailure(message: e.toString()));
    }
  }
}
