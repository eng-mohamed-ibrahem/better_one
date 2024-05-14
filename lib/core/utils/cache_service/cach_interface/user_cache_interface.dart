import 'package:better_one/model/user_model/user_model.dart';

abstract class UserCacheInterface {
  Future<bool> setUserDataToLocale({required Map<String, dynamic> user});
  UserModel? getUserDataFromLocale();
  Future<bool> deleteUser();
}
