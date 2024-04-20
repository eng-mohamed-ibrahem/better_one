// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthViewmodelState {
  bool get isInitial => throw _privateConstructorUsedError;
  bool get isSignupLoading => throw _privateConstructorUsedError;
  bool get isSignupSuccess => throw _privateConstructorUsedError;
  bool get isSignupFailed => throw _privateConstructorUsedError;
  bool get isLoginLoading => throw _privateConstructorUsedError;
  bool get isLoginSuccess => throw _privateConstructorUsedError;
  bool get isLoginFailed => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  bool get isLogoutLoading => throw _privateConstructorUsedError;
  bool get isLogoutSuccess => throw _privateConstructorUsedError;
  bool get isLogoutFailed => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthViewmodelStateCopyWith<AuthViewmodelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthViewmodelStateCopyWith<$Res> {
  factory $AuthViewmodelStateCopyWith(
          AuthViewmodelState value, $Res Function(AuthViewmodelState) then) =
      _$AuthViewmodelStateCopyWithImpl<$Res, AuthViewmodelState>;
  @useResult
  $Res call(
      {bool isInitial,
      bool isSignupLoading,
      bool isSignupSuccess,
      bool isSignupFailed,
      bool isLoginLoading,
      bool isLoginSuccess,
      bool isLoginFailed,
      UserModel? userModel,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutFailed,
      String? errorMessage});

  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$AuthViewmodelStateCopyWithImpl<$Res, $Val extends AuthViewmodelState>
    implements $AuthViewmodelStateCopyWith<$Res> {
  _$AuthViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isSignupLoading = null,
    Object? isSignupSuccess = null,
    Object? isSignupFailed = null,
    Object? isLoginLoading = null,
    Object? isLoginSuccess = null,
    Object? isLoginFailed = null,
    Object? userModel = freezed,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignupLoading: null == isSignupLoading
          ? _value.isSignupLoading
          : isSignupLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignupSuccess: null == isSignupSuccess
          ? _value.isSignupSuccess
          : isSignupSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignupFailed: null == isSignupFailed
          ? _value.isSignupFailed
          : isSignupFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginLoading: null == isLoginLoading
          ? _value.isLoginLoading
          : isLoginLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: null == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginFailed: null == isLoginFailed
          ? _value.isLoginFailed
          : isLoginFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userModel {
    if (_value.userModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userModel!, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthViewmodelStateImplCopyWith<$Res>
    implements $AuthViewmodelStateCopyWith<$Res> {
  factory _$$AuthViewmodelStateImplCopyWith(_$AuthViewmodelStateImpl value,
          $Res Function(_$AuthViewmodelStateImpl) then) =
      __$$AuthViewmodelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitial,
      bool isSignupLoading,
      bool isSignupSuccess,
      bool isSignupFailed,
      bool isLoginLoading,
      bool isLoginSuccess,
      bool isLoginFailed,
      UserModel? userModel,
      bool isLogoutLoading,
      bool isLogoutSuccess,
      bool isLogoutFailed,
      String? errorMessage});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$AuthViewmodelStateImplCopyWithImpl<$Res>
    extends _$AuthViewmodelStateCopyWithImpl<$Res, _$AuthViewmodelStateImpl>
    implements _$$AuthViewmodelStateImplCopyWith<$Res> {
  __$$AuthViewmodelStateImplCopyWithImpl(_$AuthViewmodelStateImpl _value,
      $Res Function(_$AuthViewmodelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isSignupLoading = null,
    Object? isSignupSuccess = null,
    Object? isSignupFailed = null,
    Object? isLoginLoading = null,
    Object? isLoginSuccess = null,
    Object? isLoginFailed = null,
    Object? userModel = freezed,
    Object? isLogoutLoading = null,
    Object? isLogoutSuccess = null,
    Object? isLogoutFailed = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthViewmodelStateImpl(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignupLoading: null == isSignupLoading
          ? _value.isSignupLoading
          : isSignupLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignupSuccess: null == isSignupSuccess
          ? _value.isSignupSuccess
          : isSignupSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isSignupFailed: null == isSignupFailed
          ? _value.isSignupFailed
          : isSignupFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginLoading: null == isLoginLoading
          ? _value.isLoginLoading
          : isLoginLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginSuccess: null == isLoginSuccess
          ? _value.isLoginSuccess
          : isLoginSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginFailed: null == isLoginFailed
          ? _value.isLoginFailed
          : isLoginFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
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
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthViewmodelStateImpl implements _AuthViewmodelState {
  const _$AuthViewmodelStateImpl(
      {this.isInitial = true,
      this.isSignupLoading = false,
      this.isSignupSuccess = false,
      this.isSignupFailed = false,
      this.isLoginLoading = false,
      this.isLoginSuccess = false,
      this.isLoginFailed = false,
      this.userModel = null,
      this.isLogoutLoading = false,
      this.isLogoutSuccess = false,
      this.isLogoutFailed = false,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitial;
  @override
  @JsonKey()
  final bool isSignupLoading;
  @override
  @JsonKey()
  final bool isSignupSuccess;
  @override
  @JsonKey()
  final bool isSignupFailed;
  @override
  @JsonKey()
  final bool isLoginLoading;
  @override
  @JsonKey()
  final bool isLoginSuccess;
  @override
  @JsonKey()
  final bool isLoginFailed;
  @override
  @JsonKey()
  final UserModel? userModel;
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
  final String? errorMessage;

  @override
  String toString() {
    return 'AuthViewmodelState(isInitial: $isInitial, isSignupLoading: $isSignupLoading, isSignupSuccess: $isSignupSuccess, isSignupFailed: $isSignupFailed, isLoginLoading: $isLoginLoading, isLoginSuccess: $isLoginSuccess, isLoginFailed: $isLoginFailed, userModel: $userModel, isLogoutLoading: $isLogoutLoading, isLogoutSuccess: $isLogoutSuccess, isLogoutFailed: $isLogoutFailed, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthViewmodelStateImpl &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isSignupLoading, isSignupLoading) ||
                other.isSignupLoading == isSignupLoading) &&
            (identical(other.isSignupSuccess, isSignupSuccess) ||
                other.isSignupSuccess == isSignupSuccess) &&
            (identical(other.isSignupFailed, isSignupFailed) ||
                other.isSignupFailed == isSignupFailed) &&
            (identical(other.isLoginLoading, isLoginLoading) ||
                other.isLoginLoading == isLoginLoading) &&
            (identical(other.isLoginSuccess, isLoginSuccess) ||
                other.isLoginSuccess == isLoginSuccess) &&
            (identical(other.isLoginFailed, isLoginFailed) ||
                other.isLoginFailed == isLoginFailed) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.isLogoutLoading, isLogoutLoading) ||
                other.isLogoutLoading == isLogoutLoading) &&
            (identical(other.isLogoutSuccess, isLogoutSuccess) ||
                other.isLogoutSuccess == isLogoutSuccess) &&
            (identical(other.isLogoutFailed, isLogoutFailed) ||
                other.isLogoutFailed == isLogoutFailed) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInitial,
      isSignupLoading,
      isSignupSuccess,
      isSignupFailed,
      isLoginLoading,
      isLoginSuccess,
      isLoginFailed,
      userModel,
      isLogoutLoading,
      isLogoutSuccess,
      isLogoutFailed,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthViewmodelStateImplCopyWith<_$AuthViewmodelStateImpl> get copyWith =>
      __$$AuthViewmodelStateImplCopyWithImpl<_$AuthViewmodelStateImpl>(
          this, _$identity);
}

abstract class _AuthViewmodelState implements AuthViewmodelState {
  const factory _AuthViewmodelState(
      {final bool isInitial,
      final bool isSignupLoading,
      final bool isSignupSuccess,
      final bool isSignupFailed,
      final bool isLoginLoading,
      final bool isLoginSuccess,
      final bool isLoginFailed,
      final UserModel? userModel,
      final bool isLogoutLoading,
      final bool isLogoutSuccess,
      final bool isLogoutFailed,
      final String? errorMessage}) = _$AuthViewmodelStateImpl;

  @override
  bool get isInitial;
  @override
  bool get isSignupLoading;
  @override
  bool get isSignupSuccess;
  @override
  bool get isSignupFailed;
  @override
  bool get isLoginLoading;
  @override
  bool get isLoginSuccess;
  @override
  bool get isLoginFailed;
  @override
  UserModel? get userModel;
  @override
  bool get isLogoutLoading;
  @override
  bool get isLogoutSuccess;
  @override
  bool get isLogoutFailed;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthViewmodelStateImplCopyWith<_$AuthViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
