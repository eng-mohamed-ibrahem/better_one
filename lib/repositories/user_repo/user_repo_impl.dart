import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/user_data_source/user_source_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';

class UserRepoImpl implements UserRepoInterface {
  UserRepoImpl({required this.userSource});
  final UserSourceInterface userSource;
  @override
  Future<Result<UserModel, Failure>> getUserDataFromLocal() async {
    return await userSource.getUserDataFromLocal();
  }

  @override
  Future<Result<bool, Failure>> setUserDataToLocal({required UserModel user}) {
    return userSource.setUserDataToLocal(user: user);
  }
}
