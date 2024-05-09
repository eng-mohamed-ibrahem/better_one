import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/data_source/user_data_source/user_source_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';

class RemoteUserDataSource implements UserSourceInterface {
  @override
  Future<ResultHandler<UserModel, ApiFailure>> getUserData() async {
    try {
      var online = await isOnline();
      return online.when(
        success: (online) {
          if (online) {
            return ResultHandler.success(
              data: UserModel.fromJson(
                  client.userAccount.auth.currentUser!.toJson()),
            );
          } else {
            return ResultHandler.failure(
                error: ApiFailure.fromSupabaseError(
                    message: 'Session is Expired'));
          }
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ApiFailure>> isOnline() async {
    try {
      // if the [currentSession] is [null] so [isExpired] = true
      return ResultHandler.success(
          data: !(client.userAccount.auth.currentSession?.isExpired ?? true));
    } catch (e) {
      return ResultHandler.failure(
        error: ApiFailure.fromSupabaseError(message: e.toString()),
      );
    }
  }

  @override
  Future<ResultHandler<bool, ApiFailure>> logOut() async {
    try {
      await client.userAccount.auth.signOut();
      return const ResultHandler.success(data: true);
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }
}
