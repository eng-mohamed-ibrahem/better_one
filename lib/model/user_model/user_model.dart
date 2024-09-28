import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    required String email,
    @JsonKey(name: 'display_name') required String name,
    @JsonKey(name: "photo_url") String? photoUrl,
    // @JsonKey(readValue: readValue, name: 'display_name') required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  String asString() => json.encode(toJson());

  factory UserModel.fromString(String src) =>
      UserModel.fromJson(json.decode(src));
}

String readValue(Map<dynamic, dynamic> json, String name) =>
    json['user_metadata'][name] ?? "user";
