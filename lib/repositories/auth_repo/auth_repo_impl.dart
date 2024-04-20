import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_interface.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthRepoImpl implements AuthRepoInterface {
  AuthRepoImpl({required this.auth});
  final AuthInterface auth;
  @override
  Future<Result<UserModel, Failure>> logIn(
      {required String email, required String password}) async {
    var status = await Connectivity().checkConnectivity();
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      return auth.logIn(email: email, password: password);
    } else {
      return Result.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<Result<UserModel, Failure>> signUp(
      {required String email, required String password}) async {
    var status = await Connectivity().checkConnectivity();
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      return auth.signUp(email: email, password: password);
    } else {
      return Result.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<Result<bool, Failure>> isOnline() async {
    var status = await Connectivity().checkConnectivity();
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      return auth.isOnline();
    } else {
      return Result.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<Result<bool, Failure>> logOut() async {
    var status = await Connectivity().checkConnectivity();
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      return auth.logOut();
    } else {
      return Result.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
