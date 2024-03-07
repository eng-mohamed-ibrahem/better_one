// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_viewmode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SettingViewModelState {
  bool get isInitial => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isFailed => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingViewModelStateCopyWith<SettingViewModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingViewModelStateCopyWith<$Res> {
  factory $SettingViewModelStateCopyWith(SettingViewModelState value,
          $Res Function(SettingViewModelState) then) =
      _$SettingViewModelStateCopyWithImpl<$Res, SettingViewModelState>;
  @useResult
  $Res call(
      {bool isInitial,
      bool isLoading,
      bool isCompleted,
      bool isFailed,
      String? errorMessage});
}

/// @nodoc
class _$SettingViewModelStateCopyWithImpl<$Res,
        $Val extends SettingViewModelState>
    implements $SettingViewModelStateCopyWith<$Res> {
  _$SettingViewModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
    Object? isCompleted = null,
    Object? isFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingViewModelStateImplCopyWith<$Res>
    implements $SettingViewModelStateCopyWith<$Res> {
  factory _$$SettingViewModelStateImplCopyWith(
          _$SettingViewModelStateImpl value,
          $Res Function(_$SettingViewModelStateImpl) then) =
      __$$SettingViewModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitial,
      bool isLoading,
      bool isCompleted,
      bool isFailed,
      String? errorMessage});
}

/// @nodoc
class __$$SettingViewModelStateImplCopyWithImpl<$Res>
    extends _$SettingViewModelStateCopyWithImpl<$Res,
        _$SettingViewModelStateImpl>
    implements _$$SettingViewModelStateImplCopyWith<$Res> {
  __$$SettingViewModelStateImplCopyWithImpl(_$SettingViewModelStateImpl _value,
      $Res Function(_$SettingViewModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isLoading = null,
    Object? isCompleted = null,
    Object? isFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SettingViewModelStateImpl(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailed: null == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SettingViewModelStateImpl implements _SettingViewModelState {
  const _$SettingViewModelStateImpl(
      {this.isInitial = true,
      this.isLoading = false,
      this.isCompleted = false,
      this.isFailed = false,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final bool isFailed;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'SettingViewModelState(isInitial: $isInitial, isLoading: $isLoading, isCompleted: $isCompleted, isFailed: $isFailed, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingViewModelStateImpl &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isInitial, isLoading, isCompleted, isFailed, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingViewModelStateImplCopyWith<_$SettingViewModelStateImpl>
      get copyWith => __$$SettingViewModelStateImplCopyWithImpl<
          _$SettingViewModelStateImpl>(this, _$identity);
}

abstract class _SettingViewModelState implements SettingViewModelState {
  const factory _SettingViewModelState(
      {final bool isInitial,
      final bool isLoading,
      final bool isCompleted,
      final bool isFailed,
      final String? errorMessage}) = _$SettingViewModelStateImpl;

  @override
  bool get isInitial;
  @override
  bool get isLoading;
  @override
  bool get isCompleted;
  @override
  bool get isFailed;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SettingViewModelStateImplCopyWith<_$SettingViewModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
