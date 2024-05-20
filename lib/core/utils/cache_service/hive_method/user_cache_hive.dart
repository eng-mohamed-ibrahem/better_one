import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

class UserCacheByHive implements UserCacheInterface {
  UserCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;

  @override
  Future<bool> deleteUser() async {
    await cacheInit.appBox.delete(CacheKeys.userId);
    return true;
  }

  @override
  String? getUserIdFromLocale() {
    return cacheInit.appBox.get(CacheKeys.userId);
  }

  @override
  Future<bool> setUserIdToLocale({required String userId}) async {
    await cacheInit.appBox.put(CacheKeys.userId, userId);
    return true;
  }
}
