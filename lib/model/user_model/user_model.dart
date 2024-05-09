import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
   @JsonKey(name: 'created_at') required String createdAt,
   @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
