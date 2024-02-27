import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';

abstract class ApiConsumer {
  Future<Result<dynamic, ApiFailure>> get(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<Result<dynamic, ApiFailure>> post(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<Result<dynamic, ApiFailure>> patch(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<Result<dynamic, ApiFailure>> put(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<Result<dynamic, ApiFailure>> delete(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
}
