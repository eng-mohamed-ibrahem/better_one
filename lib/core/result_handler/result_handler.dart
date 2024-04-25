import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_handler.freezed.dart';

@freezed
class ResultHandler<Data, Error> with _$ResultHandler<Data, Error> {
  const factory ResultHandler.success({required Data data}) =
      _Success<Data, Error>;

  const factory ResultHandler.failure({required Error error}) =
      _Failure<Data, Error>;
}
