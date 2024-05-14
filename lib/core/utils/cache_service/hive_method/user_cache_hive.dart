import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/model/user_model/user_model.dart';

class UserCacheByHive implements UserCacheInterface {
  UserCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  UserModel? getUserDataFromLocale() {
    return cacheInit.appBox.containsKey(CacheKeys.user)
        ? UserModel.fromJson(cacheInit.appBox.get(CacheKeys.user))
        : null;
  }

  @override
  Future<bool> setUserDataToLocale({required Map<String, dynamic> user}) async {
    await cacheInit.appBox.put(CacheKeys.user, user);
    return true;
  }

  @override
  Future<bool> deleteUser() async {
    await cacheInit.appBox.delete(CacheKeys.user);
    return true;
  }
}
