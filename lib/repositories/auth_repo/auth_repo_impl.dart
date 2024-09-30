import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/network_connection/network_connection.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_interface.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthRepoImpl implements AuthRepoInterface {
  AuthRepoImpl({required this.authSource});
  final AuthInterface authSource;
  @override
  Future<ResultHandler<UserModel, Failure>> logIn(
      {required String email, required String password}) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return authSource.logIn(email: email, password: password);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<UserModel, Failure>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return authSource.signUp(email: email, password: password, name: name);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<void, Failure>> sendForgotPassword(String email) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return authSource.sendForgotPassword(email);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

}
