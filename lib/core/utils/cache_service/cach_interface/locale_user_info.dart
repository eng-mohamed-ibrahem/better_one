abstract class LocaleUserInfo {
  Future<bool> setUserIdToLocale({required String userId});
  String? getUserIdFromLocale();
  Future<bool> deleteUser();
}
