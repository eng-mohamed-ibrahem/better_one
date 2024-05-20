import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/data_source/user_data_source/user_source_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteUserDataSource implements UserSourceInterface {
  @override
  Future<ResultHandler<UserModel?, Failure>> getUserDetails() async {
    try {
      return ResultHandler.success(
        data: isActive
            ? UserModel.fromJson(client.userAccount.auth.currentUser!.toJson())
            : null,
      );
    } on AuthException catch (e) {
      return ResultHandler.failure(
        error: SupabaseFailure(message: e.message),
      );
    } on FormatException catch (e) {
      return ResultHandler.failure(
        error: ParserFailure(message: e.message),
      );
    } catch (e) {
      return ResultHandler.failure(
        error: OtherFailure(message: e.toString()),
      );
    }
  }

  bool get isActive {
    return client.userAccount.auth.currentSession == null
        ? false
        : !client.userAccount.auth.currentSession!.isExpired;
  }

  @override
  Future<ResultHandler<bool, Failure>> logOut() async {
    try {
      await client.userAccount.auth.signOut();
      return const ResultHandler.success(data: true);
    } catch (e) {
      return ResultHandler.failure(
          error: SupabaseFailure(message: e.toString()));
    }
  }
}
