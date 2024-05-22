import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/user_data_source/user_source_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/utils/network_connection/network_connection.dart';

class UserRepoImpl implements UserRepoInterface {
  UserRepoImpl({required this.userSource});
  final UserSourceInterface userSource;

  @override
  Future<ResultHandler<UserModel?, Failure>> getUserDetails() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await userSource.getUserDetails();
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> logOut() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await userSource.logOut();
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<UserModel?, Failure>> updateUserDetails(
      {String? newEmail, String? newPassword, String? newDisplayName}) async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await userSource.updateUserDetails(
        newEmail: newEmail,
        newPassword: newPassword,
        newDisplayName: newDisplayName,
      );
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
