import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_interface.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthRepoImpl implements AuthRepoInterface {
  AuthRepoImpl({required this.authSource});
  final AuthInterface authSource;
  @override
  Future<ResultHandler<UserModel, Failure>> logIn(
      {required String email, required String password}) async {
    var status = await Connectivity().checkConnectivity();
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      return authSource.logIn(email: email, password: password);
    } else {
      return ResultHandler.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<UserModel, Failure>> signUp(
      {required String email, required String password}) async {
    var status = await Connectivity().checkConnectivity();
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      return authSource.signUp(email: email, password: password);
    } else {
      return ResultHandler.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
