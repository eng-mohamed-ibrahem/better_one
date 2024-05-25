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

  /// logout
  bool get isLogoutLoading => throw _privateConstructorUsedError;
  bool get isLogoutSuccess => throw _privateConstructorUsedError;
  bool get isLogoutFailed => throw _privateConstructorUsedError;

  /// user details
  bool get isGetUserDetailsLoading => throw _privateConstructorUsedError;
  bool get isGetUserDetailsSuccess => throw _privateConstructorUsedError;
  bool get isGetUserDetailsFailed => throw _privateConstructorUsedError;

  /// the current user
  UserModel? get user => throw _privateConstructorUsedError;

  /// check activity of user
  bool get isUserActiveLoading => throw _privateConstructorUsedError;
  bool get isUserActiveSuccess => throw _privateConstructorUsedError;
  bool get isUserActiveFailed => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// upload tasks
  bool get isUploadTasksLoading => throw _privateConstructorUsedError;
  bool get isUploadTasksSuccess => throw _privateConstructorUsedError;
  bool get isUploadTasksFailed => throw _privateConstructorUsedError;

  /// download tasks
  bool get isDownloadTasksLoading => throw _privateConstructorUsedError;
  bool get isDownloadTasksSuccess => throw _privateConstructorUsedError;
  bool get isDownloadTasksFailed => throw _privateConstructorUsedError;

  /// create task
  bool get isCreateTaskLoading => throw _privateConstructorUsedError;
  bool get isCreateTaskSuccess => throw _privateConstructorUsedError;
  bool get isCreateTaskFailed => throw _privateConstructorUsedError;
  TaskModel? get createdTask => throw _privateConstructorUsedError;

  /// update task
  bool get isUpdateTaskLoading => throw _privateConstructorUsedError;
  bool get isUpdateTaskSuccess => throw _privateConstructorUsedError;
  bool get isUpdateTaskFailed => throw _privateConstructorUsedError;
  TaskModel? get updatedTask => throw _privateConstructorUsedError;

  /// delete task
  bool get isDeleteTaskLoading => throw _privateConstructorUsedError;
  bool get isDeleteTaskSuccess => throw _privateConstructorUsedError;
  bool get isDeleteTaskFailed => throw _privateConstructorUsedError;
  TaskModel? get deletedTask => throw _privateConstructorUsedError;

  /// get task
  bool get isGetTaskByIdLoading => throw _privateConstructorUsedError;
  bool get isGetTaskByIdCompleted => throw _privateConstructorUsedError;
  bool get isGetTaskByIdFailed => throw _privateConstructorUsedError;
  TaskModel? get taskById => throw _privateConstructorUsedError;

  /// error
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
      bool isGetUserDetailsLoading,
      bool isGetUserDetailsSuccess,
      bool isGetUserDetailsFailed,
      UserModel? user,
      bool isUserActiveLoading,
      bool isUserActiveSuccess,
      bool isUserActiveFailed,
      bool isActive,
      bool isUploadTasksLoading,
      bool isUploadTasksSuccess,
      bool isUploadTasksFailed,
      bool isDownloadTasksLoading,
      bool isDownloadTasksSuccess,
      bool isDownloadTasksFailed,
      bool isCreateTaskLoading,
      bool isCreateTaskSuccess,
      bool isCreateTaskFailed,
      TaskModel? createdTask,
      bool isUpdateTaskLoading,
      bool isUpdateTaskSuccess,
      bool isUpdateTaskFailed,
      TaskModel? updatedTask,
      bool isDeleteTaskLoading,
      bool isDeleteTaskSuccess,
      bool isDeleteTaskFailed,
      TaskModel? deletedTask,
      bool isGetTaskByIdLoading,
      bool isGetTaskByIdCompleted,
      bool isGetTaskByIdFailed,
      TaskModel? taskById,
      String? errorMessage});

  $UserModelCopyWith<$Res>? get user;
  $TaskModelCopyWith<$Res>? get createdTask;
  $TaskModelCopyWith<$Res>? get updatedTask;
  $TaskModelCopyWith<$Res>? get deletedTask;
  $TaskModelCopyWith<$Res>? get taskById;
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
    Object? isGetUserDetailsLoading = null,
    Object? isGetUserDetailsSuccess = null,
    Object? isGetUserDetailsFailed = null,
    Object? user = freezed,
    Object? isUserActiveLoading = null,
    Object? isUserActiveSuccess = null,
    Object? isUserActiveFailed = null,
    Object? isActive = null,
    Object? isUploadTasksLoading = null,
    Object? isUploadTasksSuccess = null,
    Object? isUploadTasksFailed = null,
    Object? isDownloadTasksLoading = null,
    Object? isDownloadTasksSuccess = null,
    Object? isDownloadTasksFailed = null,
    Object? isCreateTaskLoading = null,
    Object? isCreateTaskSuccess = null,
    Object? isCreateTaskFailed = null,
    Object? createdTask = freezed,
    Object? isUpdateTaskLoading = null,
    Object? isUpdateTaskSuccess = null,
    Object? isUpdateTaskFailed = null,
    Object? updatedTask = freezed,
    Object? isDeleteTaskLoading = null,
    Object? isDeleteTaskSuccess = null,
    Object? isDeleteTaskFailed = null,
    Object? deletedTask = freezed,
    Object? isGetTaskByIdLoading = null,
    Object? isGetTaskByIdCompleted = null,
    Object? isGetTaskByIdFailed = null,
    Object? taskById = freezed,
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
      isGetUserDetailsLoading: null == isGetUserDetailsLoading
          ? _value.isGetUserDetailsLoading
          : isGetUserDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsSuccess: null == isGetUserDetailsSuccess
          ? _value.isGetUserDetailsSuccess
          : isGetUserDetailsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsFailed: null == isGetUserDetailsFailed
          ? _value.isGetUserDetailsFailed
          : isGetUserDetailsFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isUserActiveLoading: null == isUserActiveLoading
          ? _value.isUserActiveLoading
          : isUserActiveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveSuccess: null == isUserActiveSuccess
          ? _value.isUserActiveSuccess
          : isUserActiveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveFailed: null == isUserActiveFailed
          ? _value.isUserActiveFailed
          : isUserActiveFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadTasksLoading: null == isUploadTasksLoading
          ? _value.isUploadTasksLoading
          : isUploadTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadTasksSuccess: null == isUploadTasksSuccess
          ? _value.isUploadTasksSuccess
          : isUploadTasksSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadTasksFailed: null == isUploadTasksFailed
          ? _value.isUploadTasksFailed
          : isUploadTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksLoading: null == isDownloadTasksLoading
          ? _value.isDownloadTasksLoading
          : isDownloadTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksSuccess: null == isDownloadTasksSuccess
          ? _value.isDownloadTasksSuccess
          : isDownloadTasksSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksFailed: null == isDownloadTasksFailed
          ? _value.isDownloadTasksFailed
          : isDownloadTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskLoading: null == isCreateTaskLoading
          ? _value.isCreateTaskLoading
          : isCreateTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskSuccess: null == isCreateTaskSuccess
          ? _value.isCreateTaskSuccess
          : isCreateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskFailed: null == isCreateTaskFailed
          ? _value.isCreateTaskFailed
          : isCreateTaskFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTask: freezed == createdTask
          ? _value.createdTask
          : createdTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      isUpdateTaskLoading: null == isUpdateTaskLoading
          ? _value.isUpdateTaskLoading
          : isUpdateTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTaskSuccess: null == isUpdateTaskSuccess
          ? _value.isUpdateTaskSuccess
          : isUpdateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTaskFailed: null == isUpdateTaskFailed
          ? _value.isUpdateTaskFailed
          : isUpdateTaskFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedTask: freezed == updatedTask
          ? _value.updatedTask
          : updatedTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      isDeleteTaskLoading: null == isDeleteTaskLoading
          ? _value.isDeleteTaskLoading
          : isDeleteTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteTaskSuccess: null == isDeleteTaskSuccess
          ? _value.isDeleteTaskSuccess
          : isDeleteTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteTaskFailed: null == isDeleteTaskFailed
          ? _value.isDeleteTaskFailed
          : isDeleteTaskFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedTask: freezed == deletedTask
          ? _value.deletedTask
          : deletedTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      isGetTaskByIdLoading: null == isGetTaskByIdLoading
          ? _value.isGetTaskByIdLoading
          : isGetTaskByIdLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTaskByIdCompleted: null == isGetTaskByIdCompleted
          ? _value.isGetTaskByIdCompleted
          : isGetTaskByIdCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTaskByIdFailed: null == isGetTaskByIdFailed
          ? _value.isGetTaskByIdFailed
          : isGetTaskByIdFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      taskById: freezed == taskById
          ? _value.taskById
          : taskById // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
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

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res>? get createdTask {
    if (_value.createdTask == null) {
      return null;
    }

    return $TaskModelCopyWith<$Res>(_value.createdTask!, (value) {
      return _then(_value.copyWith(createdTask: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res>? get updatedTask {
    if (_value.updatedTask == null) {
      return null;
    }

    return $TaskModelCopyWith<$Res>(_value.updatedTask!, (value) {
      return _then(_value.copyWith(updatedTask: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res>? get deletedTask {
    if (_value.deletedTask == null) {
      return null;
    }

    return $TaskModelCopyWith<$Res>(_value.deletedTask!, (value) {
      return _then(_value.copyWith(deletedTask: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res>? get taskById {
    if (_value.taskById == null) {
      return null;
    }

    return $TaskModelCopyWith<$Res>(_value.taskById!, (value) {
      return _then(_value.copyWith(taskById: value) as $Val);
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
      bool isGetUserDetailsLoading,
      bool isGetUserDetailsSuccess,
      bool isGetUserDetailsFailed,
      UserModel? user,
      bool isUserActiveLoading,
      bool isUserActiveSuccess,
      bool isUserActiveFailed,
      bool isActive,
      bool isUploadTasksLoading,
      bool isUploadTasksSuccess,
      bool isUploadTasksFailed,
      bool isDownloadTasksLoading,
      bool isDownloadTasksSuccess,
      bool isDownloadTasksFailed,
      bool isCreateTaskLoading,
      bool isCreateTaskSuccess,
      bool isCreateTaskFailed,
      TaskModel? createdTask,
      bool isUpdateTaskLoading,
      bool isUpdateTaskSuccess,
      bool isUpdateTaskFailed,
      TaskModel? updatedTask,
      bool isDeleteTaskLoading,
      bool isDeleteTaskSuccess,
      bool isDeleteTaskFailed,
      TaskModel? deletedTask,
      bool isGetTaskByIdLoading,
      bool isGetTaskByIdCompleted,
      bool isGetTaskByIdFailed,
      TaskModel? taskById,
      String? errorMessage});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $TaskModelCopyWith<$Res>? get createdTask;
  @override
  $TaskModelCopyWith<$Res>? get updatedTask;
  @override
  $TaskModelCopyWith<$Res>? get deletedTask;
  @override
  $TaskModelCopyWith<$Res>? get taskById;
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
    Object? isGetUserDetailsLoading = null,
    Object? isGetUserDetailsSuccess = null,
    Object? isGetUserDetailsFailed = null,
    Object? user = freezed,
    Object? isUserActiveLoading = null,
    Object? isUserActiveSuccess = null,
    Object? isUserActiveFailed = null,
    Object? isActive = null,
    Object? isUploadTasksLoading = null,
    Object? isUploadTasksSuccess = null,
    Object? isUploadTasksFailed = null,
    Object? isDownloadTasksLoading = null,
    Object? isDownloadTasksSuccess = null,
    Object? isDownloadTasksFailed = null,
    Object? isCreateTaskLoading = null,
    Object? isCreateTaskSuccess = null,
    Object? isCreateTaskFailed = null,
    Object? createdTask = freezed,
    Object? isUpdateTaskLoading = null,
    Object? isUpdateTaskSuccess = null,
    Object? isUpdateTaskFailed = null,
    Object? updatedTask = freezed,
    Object? isDeleteTaskLoading = null,
    Object? isDeleteTaskSuccess = null,
    Object? isDeleteTaskFailed = null,
    Object? deletedTask = freezed,
    Object? isGetTaskByIdLoading = null,
    Object? isGetTaskByIdCompleted = null,
    Object? isGetTaskByIdFailed = null,
    Object? taskById = freezed,
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
      isGetUserDetailsLoading: null == isGetUserDetailsLoading
          ? _value.isGetUserDetailsLoading
          : isGetUserDetailsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsSuccess: null == isGetUserDetailsSuccess
          ? _value.isGetUserDetailsSuccess
          : isGetUserDetailsSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetUserDetailsFailed: null == isGetUserDetailsFailed
          ? _value.isGetUserDetailsFailed
          : isGetUserDetailsFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isUserActiveLoading: null == isUserActiveLoading
          ? _value.isUserActiveLoading
          : isUserActiveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveSuccess: null == isUserActiveSuccess
          ? _value.isUserActiveSuccess
          : isUserActiveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserActiveFailed: null == isUserActiveFailed
          ? _value.isUserActiveFailed
          : isUserActiveFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadTasksLoading: null == isUploadTasksLoading
          ? _value.isUploadTasksLoading
          : isUploadTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadTasksSuccess: null == isUploadTasksSuccess
          ? _value.isUploadTasksSuccess
          : isUploadTasksSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadTasksFailed: null == isUploadTasksFailed
          ? _value.isUploadTasksFailed
          : isUploadTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksLoading: null == isDownloadTasksLoading
          ? _value.isDownloadTasksLoading
          : isDownloadTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksSuccess: null == isDownloadTasksSuccess
          ? _value.isDownloadTasksSuccess
          : isDownloadTasksSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksFailed: null == isDownloadTasksFailed
          ? _value.isDownloadTasksFailed
          : isDownloadTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskLoading: null == isCreateTaskLoading
          ? _value.isCreateTaskLoading
          : isCreateTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskSuccess: null == isCreateTaskSuccess
          ? _value.isCreateTaskSuccess
          : isCreateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreateTaskFailed: null == isCreateTaskFailed
          ? _value.isCreateTaskFailed
          : isCreateTaskFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdTask: freezed == createdTask
          ? _value.createdTask
          : createdTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      isUpdateTaskLoading: null == isUpdateTaskLoading
          ? _value.isUpdateTaskLoading
          : isUpdateTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTaskSuccess: null == isUpdateTaskSuccess
          ? _value.isUpdateTaskSuccess
          : isUpdateTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTaskFailed: null == isUpdateTaskFailed
          ? _value.isUpdateTaskFailed
          : isUpdateTaskFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedTask: freezed == updatedTask
          ? _value.updatedTask
          : updatedTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      isDeleteTaskLoading: null == isDeleteTaskLoading
          ? _value.isDeleteTaskLoading
          : isDeleteTaskLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteTaskSuccess: null == isDeleteTaskSuccess
          ? _value.isDeleteTaskSuccess
          : isDeleteTaskSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteTaskFailed: null == isDeleteTaskFailed
          ? _value.isDeleteTaskFailed
          : isDeleteTaskFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedTask: freezed == deletedTask
          ? _value.deletedTask
          : deletedTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      isGetTaskByIdLoading: null == isGetTaskByIdLoading
          ? _value.isGetTaskByIdLoading
          : isGetTaskByIdLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTaskByIdCompleted: null == isGetTaskByIdCompleted
          ? _value.isGetTaskByIdCompleted
          : isGetTaskByIdCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTaskByIdFailed: null == isGetTaskByIdFailed
          ? _value.isGetTaskByIdFailed
          : isGetTaskByIdFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      taskById: freezed == taskById
          ? _value.taskById
          : taskById // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
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
      this.isGetUserDetailsLoading = false,
      this.isGetUserDetailsSuccess = false,
      this.isGetUserDetailsFailed = false,
      this.user = null,
      this.isUserActiveLoading = false,
      this.isUserActiveSuccess = false,
      this.isUserActiveFailed = false,
      this.isActive = false,
      this.isUploadTasksLoading = false,
      this.isUploadTasksSuccess = false,
      this.isUploadTasksFailed = false,
      this.isDownloadTasksLoading = false,
      this.isDownloadTasksSuccess = false,
      this.isDownloadTasksFailed = false,
      this.isCreateTaskLoading = false,
      this.isCreateTaskSuccess = false,
      this.isCreateTaskFailed = false,
      this.createdTask = null,
      this.isUpdateTaskLoading = false,
      this.isUpdateTaskSuccess = false,
      this.isUpdateTaskFailed = false,
      this.updatedTask = null,
      this.isDeleteTaskLoading = false,
      this.isDeleteTaskSuccess = false,
      this.isDeleteTaskFailed = false,
      this.deletedTask = null,
      this.isGetTaskByIdLoading = false,
      this.isGetTaskByIdCompleted = false,
      this.isGetTaskByIdFailed = false,
      this.taskById = null,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitialized;

  /// logout
  @override
  @JsonKey()
  final bool isLogoutLoading;
  @override
  @JsonKey()
  final bool isLogoutSuccess;
  @override
  @JsonKey()
  final bool isLogoutFailed;

  /// user details
  @override
  @JsonKey()
  final bool isGetUserDetailsLoading;
  @override
  @JsonKey()
  final bool isGetUserDetailsSuccess;
  @override
  @JsonKey()
  final bool isGetUserDetailsFailed;

  /// the current user
  @override
  @JsonKey()
  final UserModel? user;

  /// check activity of user
  @override
  @JsonKey()
  final bool isUserActiveLoading;
  @override
  @JsonKey()
  final bool isUserActiveSuccess;
  @override
  @JsonKey()
  final bool isUserActiveFailed;
  @override
  @JsonKey()
  final bool isActive;

  /// upload tasks
  @override
  @JsonKey()
  final bool isUploadTasksLoading;
  @override
  @JsonKey()
  final bool isUploadTasksSuccess;
  @override
  @JsonKey()
  final bool isUploadTasksFailed;

  /// download tasks
  @override
  @JsonKey()
  final bool isDownloadTasksLoading;
  @override
  @JsonKey()
  final bool isDownloadTasksSuccess;
  @override
  @JsonKey()
  final bool isDownloadTasksFailed;

  /// create task
  @override
  @JsonKey()
  final bool isCreateTaskLoading;
  @override
  @JsonKey()
  final bool isCreateTaskSuccess;
  @override
  @JsonKey()
  final bool isCreateTaskFailed;
  @override
  @JsonKey()
  final TaskModel? createdTask;

  /// update task
  @override
  @JsonKey()
  final bool isUpdateTaskLoading;
  @override
  @JsonKey()
  final bool isUpdateTaskSuccess;
  @override
  @JsonKey()
  final bool isUpdateTaskFailed;
  @override
  @JsonKey()
  final TaskModel? updatedTask;

  /// delete task
  @override
  @JsonKey()
  final bool isDeleteTaskLoading;
  @override
  @JsonKey()
  final bool isDeleteTaskSuccess;
  @override
  @JsonKey()
  final bool isDeleteTaskFailed;
  @override
  @JsonKey()
  final TaskModel? deletedTask;

  /// get task
  @override
  @JsonKey()
  final bool isGetTaskByIdLoading;
  @override
  @JsonKey()
  final bool isGetTaskByIdCompleted;
  @override
  @JsonKey()
  final bool isGetTaskByIdFailed;
  @override
  @JsonKey()
  final TaskModel? taskById;

  /// error
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'UserViewmodelState(isInitialized: $isInitialized, isLogoutLoading: $isLogoutLoading, isLogoutSuccess: $isLogoutSuccess, isLogoutFailed: $isLogoutFailed, isGetUserDetailsLoading: $isGetUserDetailsLoading, isGetUserDetailsSuccess: $isGetUserDetailsSuccess, isGetUserDetailsFailed: $isGetUserDetailsFailed, user: $user, isUserActiveLoading: $isUserActiveLoading, isUserActiveSuccess: $isUserActiveSuccess, isUserActiveFailed: $isUserActiveFailed, isActive: $isActive, isUploadTasksLoading: $isUploadTasksLoading, isUploadTasksSuccess: $isUploadTasksSuccess, isUploadTasksFailed: $isUploadTasksFailed, isDownloadTasksLoading: $isDownloadTasksLoading, isDownloadTasksSuccess: $isDownloadTasksSuccess, isDownloadTasksFailed: $isDownloadTasksFailed, isCreateTaskLoading: $isCreateTaskLoading, isCreateTaskSuccess: $isCreateTaskSuccess, isCreateTaskFailed: $isCreateTaskFailed, createdTask: $createdTask, isUpdateTaskLoading: $isUpdateTaskLoading, isUpdateTaskSuccess: $isUpdateTaskSuccess, isUpdateTaskFailed: $isUpdateTaskFailed, updatedTask: $updatedTask, isDeleteTaskLoading: $isDeleteTaskLoading, isDeleteTaskSuccess: $isDeleteTaskSuccess, isDeleteTaskFailed: $isDeleteTaskFailed, deletedTask: $deletedTask, isGetTaskByIdLoading: $isGetTaskByIdLoading, isGetTaskByIdCompleted: $isGetTaskByIdCompleted, isGetTaskByIdFailed: $isGetTaskByIdFailed, taskById: $taskById, errorMessage: $errorMessage)';
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
            (identical(other.isGetUserDetailsLoading, isGetUserDetailsLoading) ||
                other.isGetUserDetailsLoading == isGetUserDetailsLoading) &&
            (identical(other.isGetUserDetailsSuccess, isGetUserDetailsSuccess) ||
                other.isGetUserDetailsSuccess == isGetUserDetailsSuccess) &&
            (identical(other.isGetUserDetailsFailed, isGetUserDetailsFailed) ||
                other.isGetUserDetailsFailed == isGetUserDetailsFailed) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isUserActiveLoading, isUserActiveLoading) ||
                other.isUserActiveLoading == isUserActiveLoading) &&
            (identical(other.isUserActiveSuccess, isUserActiveSuccess) ||
                other.isUserActiveSuccess == isUserActiveSuccess) &&
            (identical(other.isUserActiveFailed, isUserActiveFailed) ||
                other.isUserActiveFailed == isUserActiveFailed) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isUploadTasksLoading, isUploadTasksLoading) ||
                other.isUploadTasksLoading == isUploadTasksLoading) &&
            (identical(other.isUploadTasksSuccess, isUploadTasksSuccess) ||
                other.isUploadTasksSuccess == isUploadTasksSuccess) &&
            (identical(other.isUploadTasksFailed, isUploadTasksFailed) ||
                other.isUploadTasksFailed == isUploadTasksFailed) &&
            (identical(other.isDownloadTasksLoading, isDownloadTasksLoading) ||
                other.isDownloadTasksLoading == isDownloadTasksLoading) &&
            (identical(other.isDownloadTasksSuccess, isDownloadTasksSuccess) ||
                other.isDownloadTasksSuccess == isDownloadTasksSuccess) &&
            (identical(other.isDownloadTasksFailed, isDownloadTasksFailed) ||
                other.isDownloadTasksFailed == isDownloadTasksFailed) &&
            (identical(other.isCreateTaskLoading, isCreateTaskLoading) ||
                other.isCreateTaskLoading == isCreateTaskLoading) &&
            (identical(other.isCreateTaskSuccess, isCreateTaskSuccess) ||
                other.isCreateTaskSuccess == isCreateTaskSuccess) &&
            (identical(other.isCreateTaskFailed, isCreateTaskFailed) ||
                other.isCreateTaskFailed == isCreateTaskFailed) &&
            (identical(other.createdTask, createdTask) ||
                other.createdTask == createdTask) &&
            (identical(other.isUpdateTaskLoading, isUpdateTaskLoading) ||
                other.isUpdateTaskLoading == isUpdateTaskLoading) &&
            (identical(other.isUpdateTaskSuccess, isUpdateTaskSuccess) ||
                other.isUpdateTaskSuccess == isUpdateTaskSuccess) &&
            (identical(other.isUpdateTaskFailed, isUpdateTaskFailed) ||
                other.isUpdateTaskFailed == isUpdateTaskFailed) &&
            (identical(other.updatedTask, updatedTask) ||
                other.updatedTask == updatedTask) &&
            (identical(other.isDeleteTaskLoading, isDeleteTaskLoading) ||
                other.isDeleteTaskLoading == isDeleteTaskLoading) &&
            (identical(other.isDeleteTaskSuccess, isDeleteTaskSuccess) ||
                other.isDeleteTaskSuccess == isDeleteTaskSuccess) &&
            (identical(other.isDeleteTaskFailed, isDeleteTaskFailed) ||
                other.isDeleteTaskFailed == isDeleteTaskFailed) &&
            (identical(other.deletedTask, deletedTask) ||
                other.deletedTask == deletedTask) &&
            (identical(other.isGetTaskByIdLoading, isGetTaskByIdLoading) || other.isGetTaskByIdLoading == isGetTaskByIdLoading) &&
            (identical(other.isGetTaskByIdCompleted, isGetTaskByIdCompleted) || other.isGetTaskByIdCompleted == isGetTaskByIdCompleted) &&
            (identical(other.isGetTaskByIdFailed, isGetTaskByIdFailed) || other.isGetTaskByIdFailed == isGetTaskByIdFailed) &&
            (identical(other.taskById, taskById) || other.taskById == taskById) &&
            (identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isInitialized,
        isLogoutLoading,
        isLogoutSuccess,
        isLogoutFailed,
        isGetUserDetailsLoading,
        isGetUserDetailsSuccess,
        isGetUserDetailsFailed,
        user,
        isUserActiveLoading,
        isUserActiveSuccess,
        isUserActiveFailed,
        isActive,
        isUploadTasksLoading,
        isUploadTasksSuccess,
        isUploadTasksFailed,
        isDownloadTasksLoading,
        isDownloadTasksSuccess,
        isDownloadTasksFailed,
        isCreateTaskLoading,
        isCreateTaskSuccess,
        isCreateTaskFailed,
        createdTask,
        isUpdateTaskLoading,
        isUpdateTaskSuccess,
        isUpdateTaskFailed,
        updatedTask,
        isDeleteTaskLoading,
        isDeleteTaskSuccess,
        isDeleteTaskFailed,
        deletedTask,
        isGetTaskByIdLoading,
        isGetTaskByIdCompleted,
        isGetTaskByIdFailed,
        taskById,
        errorMessage
      ]);

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
      final bool isGetUserDetailsLoading,
      final bool isGetUserDetailsSuccess,
      final bool isGetUserDetailsFailed,
      final UserModel? user,
      final bool isUserActiveLoading,
      final bool isUserActiveSuccess,
      final bool isUserActiveFailed,
      final bool isActive,
      final bool isUploadTasksLoading,
      final bool isUploadTasksSuccess,
      final bool isUploadTasksFailed,
      final bool isDownloadTasksLoading,
      final bool isDownloadTasksSuccess,
      final bool isDownloadTasksFailed,
      final bool isCreateTaskLoading,
      final bool isCreateTaskSuccess,
      final bool isCreateTaskFailed,
      final TaskModel? createdTask,
      final bool isUpdateTaskLoading,
      final bool isUpdateTaskSuccess,
      final bool isUpdateTaskFailed,
      final TaskModel? updatedTask,
      final bool isDeleteTaskLoading,
      final bool isDeleteTaskSuccess,
      final bool isDeleteTaskFailed,
      final TaskModel? deletedTask,
      final bool isGetTaskByIdLoading,
      final bool isGetTaskByIdCompleted,
      final bool isGetTaskByIdFailed,
      final TaskModel? taskById,
      final String? errorMessage}) = _$UserViewmodelStateImpl;

  @override
  bool get isInitialized;
  @override

  /// logout
  bool get isLogoutLoading;
  @override
  bool get isLogoutSuccess;
  @override
  bool get isLogoutFailed;
  @override

  /// user details
  bool get isGetUserDetailsLoading;
  @override
  bool get isGetUserDetailsSuccess;
  @override
  bool get isGetUserDetailsFailed;
  @override

  /// the current user
  UserModel? get user;
  @override

  /// check activity of user
  bool get isUserActiveLoading;
  @override
  bool get isUserActiveSuccess;
  @override
  bool get isUserActiveFailed;
  @override
  bool get isActive;
  @override

  /// upload tasks
  bool get isUploadTasksLoading;
  @override
  bool get isUploadTasksSuccess;
  @override
  bool get isUploadTasksFailed;
  @override

  /// download tasks
  bool get isDownloadTasksLoading;
  @override
  bool get isDownloadTasksSuccess;
  @override
  bool get isDownloadTasksFailed;
  @override

  /// create task
  bool get isCreateTaskLoading;
  @override
  bool get isCreateTaskSuccess;
  @override
  bool get isCreateTaskFailed;
  @override
  TaskModel? get createdTask;
  @override

  /// update task
  bool get isUpdateTaskLoading;
  @override
  bool get isUpdateTaskSuccess;
  @override
  bool get isUpdateTaskFailed;
  @override
  TaskModel? get updatedTask;
  @override

  /// delete task
  bool get isDeleteTaskLoading;
  @override
  bool get isDeleteTaskSuccess;
  @override
  bool get isDeleteTaskFailed;
  @override
  TaskModel? get deletedTask;
  @override

  /// get task
  bool get isGetTaskByIdLoading;
  @override
  bool get isGetTaskByIdCompleted;
  @override
  bool get isGetTaskByIdFailed;
  @override
  TaskModel? get taskById;
  @override

  /// error
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UserViewmodelStateImplCopyWith<_$UserViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
