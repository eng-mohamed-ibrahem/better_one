// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_calendar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCalendarModelImpl _$$EventCalendarModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EventCalendarModelImpl(
      title: json['title'] as String,
      description: json['description'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$EventCalendarModelImplToJson(
        _$EventCalendarModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
