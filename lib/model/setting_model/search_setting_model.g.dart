// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchSettingModelImpl _$$SearchSettingModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchSettingModelImpl(
      searchByTitle: json['search_by_title'] as bool? ?? true,
      searchByBody: json['search_by_body'] as bool? ?? false,
    );

Map<String, dynamic> _$$SearchSettingModelImplToJson(
        _$SearchSettingModelImpl instance) =>
    <String, dynamic>{
      'search_by_title': instance.searchByTitle,
      'search_by_body': instance.searchByBody,
    };
