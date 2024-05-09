import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';

class SupabaseAuthImpl implements AuthInterface {
  @override
  Future<ResultHandler<UserModel, ApiFailure>> logIn(
      {required String email, required String password}) async {
    try {
      var result = await client.userAccount.auth
          .signInWithPassword(email: email, password: password);
      return ResultHandler.success(
        data: UserModel.fromJson(
          {
            'id': result.user!.id,
            'email': result.user!.email,
            'createdAt': result.user!.createdAt,
            'updatedAt': result.user!.updatedAt,
          },
        ),
      );
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel, ApiFailure>> signUp(
      {required String email, required String password}) async {
    try {
      var result = await client.userAccount.auth
          .signUp(email: email, password: password);
      return ResultHandler.success(
        data: UserModel.fromJson(
          {
            'id': result.user!.id,
            'email': result.user!.email,
            'createdAt': result.user!.createdAt,
            'updatedAt': result.user!.updatedAt,
          },
        ),
      );
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }
}
