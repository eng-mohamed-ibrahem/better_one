// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserViewmodelState {
  bool get isInitialized => throw _privateConstructorUsedError;
  bool get isLogoutLoading => throw _privateConstructorUsedError;
  bool get isLogoutSuccess => throw _privateConstructorUsedError;
  bool get isLogoutFailed => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserViewmodelStateCopyWith<UserViewmodelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserViewmodelStateCopyWith<$Res> {
  factory $UserViewmodelStateCopyWith(
          UserViewmodelState value, $Res Function(UserViewmodelState) then) =
      _$UserViewmodelStateCopyWithImpl<$Res, UserViewmodelState>;
  @useResult
  $Res call(
      {bool isInitialized,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutFailed,
      UserModel? user,
      String? errorMessage});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$UserViewmodelStateCopyWithImpl<$Res, $Val extends UserViewmodelState>
    implements $UserViewmodelStateCopyWith<$Res> {
  _$UserViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutFailed = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutFailed: null == isLogoutFailed
          ? _value.isLogoutFailed
          : isLogoutFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserViewmodelStateImplCopyWith<$Res>
    implements $UserViewmodelStateCopyWith<$Res> {
  factory _$$UserViewmodelStateImplCopyWith(_$UserViewmodelStateImpl value,
          $Res Function(_$UserViewmodelStateImpl) then) =
      __$$UserViewmodelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitialized,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutFailed,
      UserModel? user,
      String? errorMessage});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$UserViewmodelStateImplCopyWithImpl<$Res>
    extends _$UserViewmodelStateCopyWithImpl<$Res, _$UserViewmodelStateImpl>
    implements _$$UserViewmodelStateImplCopyWith<$Res> {
  __$$UserViewmodelStateImplCopyWithImpl(_$UserViewmodelStateImpl _value,
      $Res Function(_$UserViewmodelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitialized = null,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutFailed = null,
    Object? user = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$UserViewmodelStateImpl(
      isInitialized: null == isInitialized
          ? _value.isInitialized
          : isInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutLoading: null == isLogoutLoading
          ? _value.isLogoutLoading
          : isLogoutLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutSuccess: null == isLogoutSuccess
          ? _value.isLogoutSuccess
          : isLogoutSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLogoutFailed: null == isLogoutFailed
          ? _value.isLogoutFailed
          : isLogoutFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserViewmodelStateImpl implements _UserViewmodelState {
  const _$UserViewmodelStateImpl(
      {this.isInitialized = true,
      this.isLogoutLoading = false,
      this.isLogoutSuccess = false,
      this.isLogoutFailed = false,
      this.user = null,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitialized;
  @override
  @JsonKey()
  final bool isLogoutLoading;
  @override
  @JsonKey()
  final bool isLogoutSuccess;
  @override
  @JsonKey()
  final bool isLogoutFailed;
  @override
  @JsonKey()
  final UserModel? user;
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'UserViewmodelState(isInitialized: $isInitialized, isLogoutLoading: $isLogoutLoading, isLogoutSuccess: $isLogoutSuccess, isLogoutFailed: $isLogoutFailed, user: $user, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserViewmodelStateImpl &&
            (identical(other.isInitialized, isInitialized) ||
                other.isInitialized == isInitialized) &&
            (identical(other.isLogoutLoading, isLogoutLoading) ||
                other.isLogoutLoading == isLogoutLoading) &&
            (identical(other.isLogoutSuccess, isLogoutSuccess) ||
                other.isLogoutSuccess == isLogoutSuccess) &&
            (identical(other.isLogoutFailed, isLogoutFailed) ||
                other.isLogoutFailed == isLogoutFailed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isInitialized, isLogoutLoading,
      isLogoutSuccess, isLogoutFailed, user, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserViewmodelStateImplCopyWith<_$UserViewmodelStateImpl> get copyWith =>
      __$$UserViewmodelStateImplCopyWithImpl<_$UserViewmodelStateImpl>(
          this, _$identity);
}

abstract class _UserViewmodelState implements UserViewmodelState {
  const factory _UserViewmodelState(
      {final bool isInitialized,
      final bool isLogoutLoading,
      final bool isLogoutSuccess,
      final bool isLogoutFailed,
      final UserModel? user,
      final String? errorMessage}) = _$UserViewmodelStateImpl;

  @override
  bool get isInitialized;
  @override
  bool get isLogoutLoading;
  @override
  bool get isLogoutSuccess;
  @override
  bool get isLogoutFailed;
  @override
  UserModel? get user;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserViewmodelStateImplCopyWith<_$UserViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
