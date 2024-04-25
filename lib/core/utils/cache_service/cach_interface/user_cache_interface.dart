import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';

abstract class UserCacheInterface {
  Future<ResultHandler<bool, CacheFailure>> setUserDataToLocal(
      {required Map<String, dynamic> user});
  Future<ResultHandler<Map<String, dynamic>, CacheFailure>>
      getUserDataFromLocal();
}
