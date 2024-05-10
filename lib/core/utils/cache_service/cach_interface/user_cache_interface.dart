import 'package:better_one/model/user_model/user_model.dart';

abstract class UserCacheInterface {
  Future<bool> setUserDataToLocal({required Map<String, dynamic> user});
  Future<UserModel> getUserDataFromLocal();
}
