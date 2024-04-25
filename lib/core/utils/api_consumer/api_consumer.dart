import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';

abstract class ApiConsumer {
  Future<ResultHandler<dynamic, ApiFailure>> get(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<ResultHandler<dynamic, ApiFailure>> post(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<ResultHandler<dynamic, ApiFailure>> patch(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<ResultHandler<dynamic, ApiFailure>> put(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
  Future<ResultHandler<dynamic, ApiFailure>> delete(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  });
}
