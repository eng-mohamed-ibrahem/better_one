abstract class LocaleUserInfo {
  Future<bool> setUserIdToLocale({required String userId});
  String? getUserIdFromLocale();
  Future<bool> deleteUser();
  Future<void> setVerified({required bool isVerified});
  bool isVerified();
  bool? isDownloadedTasks();
  bool? isUploadedTasks();
}
