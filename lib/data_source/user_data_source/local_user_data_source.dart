import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cache_service.dart';
import 'package:better_one/data_source/user_data_source/user_source_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';

class UserLocalDataSource implements UserSourceInterface {
  UserLocalDataSource({required this.userCacheInterface});
  final UserCacheInterface userCacheInterface;
  @override
  Future<ResultHandler<UserModel, Failure>> getUserDataFromLocal() async {
    try {
      var result = await userCacheInterface.getUserDataFromLocal();
      return result.when(
        success: (userJson) {
          return ResultHandler.success(data: UserModel.fromJson(userJson));
        },
        failure: (failure) {
          return ResultHandler.failure(error: failure);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> setUserDataToLocal(
      {required UserModel user}) async {
    try {
      return await userCacheInterface.setUserDataToLocal(user: user.toJson());
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
