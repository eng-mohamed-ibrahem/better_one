import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthImpl implements AuthInterface {
  @override
  Future<ResultHandler<UserModel, SupabaseFailure>> logIn(
      {required String email, required String password}) async {
    try {
      var result = await client.userAccount.auth
          .signInWithPassword(email: email, password: password);
      return ResultHandler.success(
        data: UserModel.fromJson(
          result.user!.toJson(),
        ),
      );
    } on AuthException catch (e) {
      return ResultHandler.failure(error: SupabaseFailure(message: e.message));
    }
  }

  @override
  Future<ResultHandler<UserModel, SupabaseFailure>> signUp(
      {required String email, required String password}) async {
    try {
      var result = await client.userAccount.auth.signUp(
          email: email, password: password, data: {"display_name": "wizaa"});
      return ResultHandler.success(
        data: UserModel.fromJson(
          result.user!.toJson(),
        ),
      );
    } on AuthException catch (e) {
      return ResultHandler.failure(error: SupabaseFailure(message: e.message));
    }
  }
}
