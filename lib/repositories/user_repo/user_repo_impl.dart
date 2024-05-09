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
  Future<ResultHandler<UserModel, Failure>> getUserData() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await userSource.getUserData();
    } else {
      return ResultHandler.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> isOnline() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return userSource.isOnline();
    } else {
      return ResultHandler.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> logOut() async {
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return userSource.logOut();
    } else {
      return ResultHandler.failure(
          error: OtherFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
