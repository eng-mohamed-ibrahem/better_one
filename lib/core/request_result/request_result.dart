import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_result.freezed.dart';

@freezed
class Result<Data, Error> with _$Result<Data, Error> {
  const factory Result.success({required Data data}) = _Success<Data, Error>;

  const factory Result.failure({required Error error}) = _Failure<Data, Error>;
}
