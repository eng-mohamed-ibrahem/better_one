// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventCalendarModel _$EventCalendarModelFromJson(Map<String, dynamic> json) {
  return _EventCalendarModel.fromJson(json);
}

/// @nodoc
mixin _$EventCalendarModel {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Serializes this EventCalendarModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCalendarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCalendarModelCopyWith<EventCalendarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCalendarModelCopyWith<$Res> {
  factory $EventCalendarModelCopyWith(
          EventCalendarModel value, $Res Function(EventCalendarModel) then) =
      _$EventCalendarModelCopyWithImpl<$Res, EventCalendarModel>;
  @useResult
  $Res call(
      {String title,
      String? description,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class _$EventCalendarModelCopyWithImpl<$Res, $Val extends EventCalendarModel>
    implements $EventCalendarModelCopyWith<$Res> {
  _$EventCalendarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCalendarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventCalendarModelImplCopyWith<$Res>
    implements $EventCalendarModelCopyWith<$Res> {
  factory _$$EventCalendarModelImplCopyWith(_$EventCalendarModelImpl value,
          $Res Function(_$EventCalendarModelImpl) then) =
      __$$EventCalendarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class __$$EventCalendarModelImplCopyWithImpl<$Res>
    extends _$EventCalendarModelCopyWithImpl<$Res, _$EventCalendarModelImpl>
    implements _$$EventCalendarModelImplCopyWith<$Res> {
  __$$EventCalendarModelImplCopyWithImpl(_$EventCalendarModelImpl _value,
      $Res Function(_$EventCalendarModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventCalendarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$EventCalendarModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventCalendarModelImpl implements _EventCalendarModel {
  const _$EventCalendarModelImpl(
      {required this.title,
      this.description,
      required this.startDate,
      required this.endDate});

  factory _$EventCalendarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCalendarModelImplFromJson(json);

  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'EventCalendarModel(title: $title, description: $description, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCalendarModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, startDate, endDate);

  /// Create a copy of EventCalendarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCalendarModelImplCopyWith<_$EventCalendarModelImpl> get copyWith =>
      __$$EventCalendarModelImplCopyWithImpl<_$EventCalendarModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCalendarModelImplToJson(
      this,
    );
  }
}

abstract class _EventCalendarModel implements EventCalendarModel {
  const factory _EventCalendarModel(
      {required final String title,
      final String? description,
      required final DateTime startDate,
      required final DateTime endDate}) = _$EventCalendarModelImpl;

  factory _EventCalendarModel.fromJson(Map<String, dynamic> json) =
      _$EventCalendarModelImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of EventCalendarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCalendarModelImplCopyWith<_$EventCalendarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
