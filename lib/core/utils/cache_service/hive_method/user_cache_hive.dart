import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/model/user_model/user_model.dart';

class UserCacheByHive implements UserCacheInterface {
  UserCacheByHive({required this.cacheInit});
  final HiveInitImpl cacheInit;
  @override
  Future<UserModel> getUserDataFromLocal() async {
    return UserModel.fromJson(cacheInit.appBox.get(CacheKeys.user));
  }

  @override
  Future<bool> setUserDataToLocal({required Map<String, dynamic> user}) async {
    await cacheInit.appBox.put(CacheKeys.user, user);
    return true;
  }
}
