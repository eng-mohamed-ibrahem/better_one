import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';

class HiveLocaleUserInfo implements LocaleUserInfo {
  HiveLocaleUserInfo({required this.initHive});
  final HiveInit initHive;
  @override
  Future<bool> deleteUser() async {
    await initHive.appBox.delete(CacheKeys.userId);
    await initHive.appBox.delete(CacheKeys.isVerified);
    await deleteService(download: true, upload: true);
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

  @override
  bool? isDownloadedTasks() {
    return initHive.appBox.get(CacheKeys.downloadService);
  }

  @override
  bool? isUploadedTasks() {
    return initHive.appBox.get(CacheKeys.uploadService);
  }

  Future<void> deleteService(
      {bool download = false, bool upload = false}) async {
    download ? await initHive.appBox.delete(CacheKeys.downloadService) : null;

    upload ? await initHive.appBox.delete(CacheKeys.uploadService) : null;
  }
}
