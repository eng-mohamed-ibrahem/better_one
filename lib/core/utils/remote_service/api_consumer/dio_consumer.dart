import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/remote_service/api_consumer/api_consumer.dart';
import 'package:dio/dio.dart';

class DioConsumer implements ApiConsumer {
  final String _baseUrl = 'https://api.quotable.io/';
  late final Dio dio;
  DioConsumer() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
      ),
    );
  }

  @override
  Future<ResultHandler<dynamic, ApiFailure>> delete(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  }) async {
    try {
      dio.options.headers = {
        "Content-Type": isFormData ? "multipart/form-data" : "application/json",
        if (sendAuthToken) "Authorization": "Bearer token",
      };
      return ResultHandler.success(
        data: await dio
            .delete(endPoint,
                queryParameters: query,
                data: isFormData ? FormData.fromMap(data!) : data)
            .then((value) => value.data), // return data even it list or map
      );
    } on DioException catch (e) {
      return ResultHandler.failure(error: ApiFailure.fromDioError(e));
    }
  }

  @override
  Future<ResultHandler<dynamic, ApiFailure>> get(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  }) async {
    try {
      dio.options.headers = {
        "Content-Type": isFormData ? "multipart/form-data" : "application/json",
        if (sendAuthToken) "Authorization": "Bearer token",
      };
      return ResultHandler.success(
        data: await dio
            .get(endPoint,
                queryParameters: query,
                data: isFormData ? FormData.fromMap(data!) : data)
            .then((value) => value.data),
      );
    } on DioException catch (e) {
      return ResultHandler.failure(error: ApiFailure.fromDioError(e));
    }
  }

  @override
  Future<ResultHandler<dynamic, ApiFailure>> patch(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  }) async {
    try {
      dio.options.headers = {
        "Content-Type": isFormData ? "multipart/form-data" : "application/json",
        if (sendAuthToken) "Authorization": "Bearer token",
      };
      return ResultHandler.success(
        data: await dio
            .patch(endPoint,
                queryParameters: query,
                data: isFormData ? FormData.fromMap(data!) : data)
            .then((value) => value.data),
      );
    } on DioException catch (e) {
      return ResultHandler.failure(error: ApiFailure.fromDioError(e));
    }
  }

  @override
  Future<ResultHandler<dynamic, ApiFailure>> post(
    String endPoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    bool sendAuthToken = false,
    bool isFormData = false,
  }) async {
    try {
      dio.options.headers = {
        "Content-Type": isFormData ? "multipart/form-data" : "application/json",
        if (sendAuthToken) "Authorization": "Bearer token",
      };
      return ResultHandler.success(
        data: await dio
            .post(endPoint,
                queryParameters: query,
                data: isFormData ? FormData.fromMap(data!) : data)
            .then((value) => value.data),
      );
    } on DioException catch (e) {
      return ResultHandler.failure(error: ApiFailure.fromDioError(e));
    }
  }

  @override
  Future<ResultHandler<dynamic, ApiFailure>> put(String endPoint,
      {Map<String, dynamic>? query,
      Map<String, dynamic>? data,
      bool sendAuthToken = false,
      bool isFormData = false}) async {
    try {
      dio.options.headers = {
        "Content-Type": isFormData ? "multipart/form-data" : "application/json",
        if (sendAuthToken) "Authorization": "Bearer token",
      };
      return ResultHandler.success(
        data: await dio
            .put(endPoint,
                queryParameters: query,
                data: isFormData ? FormData.fromMap(data!) : data)
            .then((value) => value.data),
      );
    } on DioException catch (e) {
      return ResultHandler.failure(error: ApiFailure.fromDioError(e));
    }
  }
}
