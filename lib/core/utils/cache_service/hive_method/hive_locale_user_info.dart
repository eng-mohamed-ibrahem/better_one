import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

class HiveLocaleUserInfo extends HiveInit implements LocaleUserInfo {
  @override
  Future<bool> deleteUser() async {
    await appBox.delete(CacheKeys.userId);
    return true;
  }

  @override
  String? getUserIdFromLocale() {
    return appBox.get(CacheKeys.userId);
  }

  @override
  Future<bool> setUserIdToLocale({required String userId}) async {
    await appBox.put(CacheKeys.userId, userId);
    return true;
  }
}
