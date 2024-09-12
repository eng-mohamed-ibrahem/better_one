import 'dart:convert';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/model/user_model/user_model.dart';

class HiveLocaleUserInfo implements LocaleUserInfo {
  HiveLocaleUserInfo({required this.initHive});
  final HiveInit initHive;
  @override
  Future<bool> deleteUser() async {
    await initHive.appBox.delete(CacheKeys.userData);
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
  UserModel? getUserData() {
    final userData = initHive.appBox.get(CacheKeys.userData);
    if (userData == null) {
      return null;
    }
    return UserModel.fromJson(jsonDecode(userData));
  }

  @override
  Future<bool> setUsetData({required UserModel user}) async {
    await initHive.appBox.put(CacheKeys.userData, jsonEncode(user.toJson()));
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
