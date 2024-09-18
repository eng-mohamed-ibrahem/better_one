import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/model/user_model/user_model.dart';

class HiveLocaleUserInfo implements LocaleUserInfo {
  @override
  Future<bool> deleteUser() async {
    await inject<HiveCache>().appCache.delete(CacheKeys.userData);
    await inject<HiveCache>().appCache.delete(CacheKeys.isVerified);
    await deleteService(download: true, upload: true);
    return true;
  }

  @override
  UserModel? getUserData() {
    final userData = inject<HiveCache>().appCache.get(CacheKeys.userData);
    if (userData == null) {
      return null;
    }
    return UserModel.fromString(userData);
  }

  @override
  Future<bool> setUsetData({required UserModel user}) async {
    await inject<HiveCache>().appCache.put(CacheKeys.userData, user.asString());
    return true;
  }

  @override
  bool isVerified() {
    return inject<HiveCache>()
        .appCache
        .get(CacheKeys.isVerified, defaultValue: false);
  }

  @override
  Future<void> setVerified({required bool isVerified}) async {
    return await inject<HiveCache>()
        .appCache
        .put(CacheKeys.isVerified, isVerified);
  }

  @override
  bool? isDownloadedTasks() {
    return inject<HiveCache>().appCache.get(CacheKeys.downloadService);
  }

  @override
  bool? isUploadedTasks() {
    return inject<HiveCache>().appCache.get(CacheKeys.uploadService);
  }

  Future<void> deleteService(
      {bool download = false, bool upload = false}) async {
    download
        ? await inject<HiveCache>().appCache.delete(CacheKeys.downloadService)
        : null;

    upload
        ? await inject<HiveCache>().appCache.delete(CacheKeys.uploadService)
        : null;
  }

  @override
  bool seenOnboarding() {
    return inject<HiveCache>()
        .appCache
        .get(CacheKeys.onboardingSeen, defaultValue: false);
  }

  @override
  Future<void> setSeenOnboarding({required bool seenOnboarding}) async {
    return await inject<HiveCache>()
        .appCache
        .put(CacheKeys.onboardingSeen, seenOnboarding);
  }
}
