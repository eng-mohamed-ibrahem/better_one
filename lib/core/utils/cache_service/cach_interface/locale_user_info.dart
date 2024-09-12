import 'package:better_one/model/user_model/user_model.dart';

abstract class LocaleUserInfo {
  Future<bool> setUsetData({required UserModel user});
  UserModel? getUserData();
  Future<bool> setUserIdToLocale({required String userId});
  String? getUserIdFromLocale();
  Future<bool> deleteUser();
  Future<void> setVerified({required bool isVerified});
  bool isVerified();
  bool? isDownloadedTasks();
  bool? isUploadedTasks();
}
