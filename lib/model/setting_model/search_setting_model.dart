import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_setting_model.freezed.dart';
part 'search_setting_model.g.dart';

@freezed
class SearchSettingModel with _$SearchSettingModel {
  const SearchSettingModel._();
  const factory SearchSettingModel({
    @JsonKey(name: "search_by_title") @Default(true) bool searchByTitle,
    @JsonKey(name: "search_by_body") @Default(false) bool searchByBody,
  }) = _SearchSettingModel;

  factory SearchSettingModel.fromJson(Map<String, dynamic> json) =>
      _$SearchSettingModelFromJson(json);

  String asString() => json.encode(toJson());

  factory SearchSettingModel.fromString(String src) =>
      SearchSettingModel.fromJson(json.decode(src) as Map<String, dynamic>);
}
