import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';

abstract class UserCacheInterface {
  Future<Result<bool, CacheFailure>> setUserDataToLocal(
      {required Map<String, dynamic> user});
  Future<Result<Map<String, dynamic>, CacheFailure>> getUserDataFromLocal();
}
