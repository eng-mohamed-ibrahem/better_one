abstract class UserCacheInterface {
  Future<bool> setUserIdToLocale({required String userId});
  String? getUserIdFromLocale();
  Future<bool> deleteUser();
}
