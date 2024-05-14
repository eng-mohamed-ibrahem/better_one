import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';

import '../../model/user_model/user_model.dart';

abstract class UserSourceInterface {
  Future<ResultHandler<UserModel?, Failure>> getUserDetails();

  Future<ResultHandler<bool, Failure>> logOut();
}
