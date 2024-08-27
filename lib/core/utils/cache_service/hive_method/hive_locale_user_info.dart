import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

class HiveLocaleUserInfo implements LocaleUserInfo {
  HiveLocaleUserInfo({required this.initHive});
  final HiveInit initHive;
  @override
  Future<bool> deleteUser() async {
    await initHive.appBox.delete(CacheKeys.userId);
    await initHive.appBox.delete(CacheKeys.isVerified);
    return true;
  }

  @override
  String? getUserIdFromLocale() {
    return initHive.appBox.get(CacheKeys.userId);
  }

  @override
  Future<bool> setUserIdToLocale({required String userId}) async {
    await initHive.appBox.put(CacheKeys.userId, userId);
    return true;
  }

  @override
  bool isVerified() {
    return initHive.appBox.get(CacheKeys.isVerified, defaultValue: false);
  }

  @override
  Future<void> setVerified({required bool isVerified}) async {
    return await initHive.appBox.put(CacheKeys.isVerified, isVerified);
  }
}
