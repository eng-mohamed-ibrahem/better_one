import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_calendar_model.freezed.dart';

part 'event_calendar_model.g.dart';

@freezed
class EventCalendarModel with _$EventCalendarModel {
  const factory EventCalendarModel({
    required String title,
    String? description,
    required DateTime startDate,
    required DateTime endDate,
  }) = _EventCalendarModel;

  factory EventCalendarModel.fromJson(Map<String, dynamic> json) =>
      _$EventCalendarModelFromJson(json);
}
