// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeViewmodelState {
  bool get isInitial => throw _privateConstructorUsedError;

  /// get all tasks
  bool get isGetAllTasksLoading => throw _privateConstructorUsedError;
  bool get isGetAllTasksCompleted => throw _privateConstructorUsedError;
  bool get isGetAllTasksFailed => throw _privateConstructorUsedError;
  List<TaskModel> get allTasks => throw _privateConstructorUsedError;

  /// error message
  String? get errorMessage => throw _privateConstructorUsedError;

  /// search
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isSearchCompleted => throw _privateConstructorUsedError;
  bool get isSearchFailed => throw _privateConstructorUsedError;
  List<TaskModel>? get searchedTasks => throw _privateConstructorUsedError;

  /// get total estimated time
  bool get isGetTotalEstimatedTimeLoading => throw _privateConstructorUsedError;
  bool get isGetTotalEstimatedTimeCompleted =>
      throw _privateConstructorUsedError;
  bool get isGetTotalEstimatedTimeFailed => throw _privateConstructorUsedError;

  /// update total estimated time
  bool get isUpdateTotalEstimatedTimeLoading =>
      throw _privateConstructorUsedError;
  bool get isUpdateTotalEstimatedTimeCompleted =>
      throw _privateConstructorUsedError;
  bool get isUpdateTotalEstimatedTimeFailed =>
      throw _privateConstructorUsedError;
  Duration get totalEstimatedTime => throw _privateConstructorUsedError;

  /// scroll controller
  ScrollController? get scrollController => throw _privateConstructorUsedError;

  /// download tasks
  bool get isDownloadTasksLoading => throw _privateConstructorUsedError;
  bool get isDownloadTasksCompleted => throw _privateConstructorUsedError;
  bool get isDownloadTasksFailed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeViewmodelStateCopyWith<HomeViewmodelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeViewmodelStateCopyWith<$Res> {
  factory $HomeViewmodelStateCopyWith(
          HomeViewmodelState value, $Res Function(HomeViewmodelState) then) =
      _$HomeViewmodelStateCopyWithImpl<$Res, HomeViewmodelState>;
  @useResult
  $Res call(
      {bool isInitial,
      bool isGetAllTasksLoading,
      bool isGetAllTasksCompleted,
      bool isGetAllTasksFailed,
      List<TaskModel> allTasks,
      String? errorMessage,
      bool isSearchLoading,
      bool isSearchCompleted,
      bool isSearchFailed,
      List<TaskModel>? searchedTasks,
      bool isGetTotalEstimatedTimeLoading,
      bool isGetTotalEstimatedTimeCompleted,
      bool isGetTotalEstimatedTimeFailed,
      bool isUpdateTotalEstimatedTimeLoading,
      bool isUpdateTotalEstimatedTimeCompleted,
      bool isUpdateTotalEstimatedTimeFailed,
      Duration totalEstimatedTime,
      ScrollController? scrollController,
      bool isDownloadTasksLoading,
      bool isDownloadTasksCompleted,
      bool isDownloadTasksFailed});
}

/// @nodoc
class _$HomeViewmodelStateCopyWithImpl<$Res, $Val extends HomeViewmodelState>
    implements $HomeViewmodelStateCopyWith<$Res> {
  _$HomeViewmodelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isGetAllTasksLoading = null,
    Object? isGetAllTasksCompleted = null,
    Object? isGetAllTasksFailed = null,
    Object? allTasks = null,
    Object? errorMessage = freezed,
    Object? isSearchLoading = null,
    Object? isSearchCompleted = null,
    Object? isSearchFailed = null,
    Object? searchedTasks = freezed,
    Object? isGetTotalEstimatedTimeLoading = null,
    Object? isGetTotalEstimatedTimeCompleted = null,
    Object? isGetTotalEstimatedTimeFailed = null,
    Object? isUpdateTotalEstimatedTimeLoading = null,
    Object? isUpdateTotalEstimatedTimeCompleted = null,
    Object? isUpdateTotalEstimatedTimeFailed = null,
    Object? totalEstimatedTime = null,
    Object? scrollController = freezed,
    Object? isDownloadTasksLoading = null,
    Object? isDownloadTasksCompleted = null,
    Object? isDownloadTasksFailed = null,
  }) {
    return _then(_value.copyWith(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllTasksLoading: null == isGetAllTasksLoading
          ? _value.isGetAllTasksLoading
          : isGetAllTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllTasksCompleted: null == isGetAllTasksCompleted
          ? _value.isGetAllTasksCompleted
          : isGetAllTasksCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllTasksFailed: null == isGetAllTasksFailed
          ? _value.isGetAllTasksFailed
          : isGetAllTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchCompleted: null == isSearchCompleted
          ? _value.isSearchCompleted
          : isSearchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchFailed: null == isSearchFailed
          ? _value.isSearchFailed
          : isSearchFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedTasks: freezed == searchedTasks
          ? _value.searchedTasks
          : searchedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      isGetTotalEstimatedTimeLoading: null == isGetTotalEstimatedTimeLoading
          ? _value.isGetTotalEstimatedTimeLoading
          : isGetTotalEstimatedTimeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTotalEstimatedTimeCompleted: null == isGetTotalEstimatedTimeCompleted
          ? _value.isGetTotalEstimatedTimeCompleted
          : isGetTotalEstimatedTimeCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTotalEstimatedTimeFailed: null == isGetTotalEstimatedTimeFailed
          ? _value.isGetTotalEstimatedTimeFailed
          : isGetTotalEstimatedTimeFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTotalEstimatedTimeLoading: null ==
              isUpdateTotalEstimatedTimeLoading
          ? _value.isUpdateTotalEstimatedTimeLoading
          : isUpdateTotalEstimatedTimeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTotalEstimatedTimeCompleted: null ==
              isUpdateTotalEstimatedTimeCompleted
          ? _value.isUpdateTotalEstimatedTimeCompleted
          : isUpdateTotalEstimatedTimeCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTotalEstimatedTimeFailed: null == isUpdateTotalEstimatedTimeFailed
          ? _value.isUpdateTotalEstimatedTimeFailed
          : isUpdateTotalEstimatedTimeFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      totalEstimatedTime: null == totalEstimatedTime
          ? _value.totalEstimatedTime
          : totalEstimatedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      isDownloadTasksLoading: null == isDownloadTasksLoading
          ? _value.isDownloadTasksLoading
          : isDownloadTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksCompleted: null == isDownloadTasksCompleted
          ? _value.isDownloadTasksCompleted
          : isDownloadTasksCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksFailed: null == isDownloadTasksFailed
          ? _value.isDownloadTasksFailed
          : isDownloadTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeViewmodelStateImplCopyWith<$Res>
    implements $HomeViewmodelStateCopyWith<$Res> {
  factory _$$HomeViewmodelStateImplCopyWith(_$HomeViewmodelStateImpl value,
          $Res Function(_$HomeViewmodelStateImpl) then) =
      __$$HomeViewmodelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInitial,
      bool isGetAllTasksLoading,
      bool isGetAllTasksCompleted,
      bool isGetAllTasksFailed,
      List<TaskModel> allTasks,
      String? errorMessage,
      bool isSearchLoading,
      bool isSearchCompleted,
      bool isSearchFailed,
      List<TaskModel>? searchedTasks,
      bool isGetTotalEstimatedTimeLoading,
      bool isGetTotalEstimatedTimeCompleted,
      bool isGetTotalEstimatedTimeFailed,
      bool isUpdateTotalEstimatedTimeLoading,
      bool isUpdateTotalEstimatedTimeCompleted,
      bool isUpdateTotalEstimatedTimeFailed,
      Duration totalEstimatedTime,
      ScrollController? scrollController,
      bool isDownloadTasksLoading,
      bool isDownloadTasksCompleted,
      bool isDownloadTasksFailed});
}

/// @nodoc
class __$$HomeViewmodelStateImplCopyWithImpl<$Res>
    extends _$HomeViewmodelStateCopyWithImpl<$Res, _$HomeViewmodelStateImpl>
    implements _$$HomeViewmodelStateImplCopyWith<$Res> {
  __$$HomeViewmodelStateImplCopyWithImpl(_$HomeViewmodelStateImpl _value,
      $Res Function(_$HomeViewmodelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInitial = null,
    Object? isGetAllTasksLoading = null,
    Object? isGetAllTasksCompleted = null,
    Object? isGetAllTasksFailed = null,
    Object? allTasks = null,
    Object? errorMessage = freezed,
    Object? isSearchLoading = null,
    Object? isSearchCompleted = null,
    Object? isSearchFailed = null,
    Object? searchedTasks = freezed,
    Object? isGetTotalEstimatedTimeLoading = null,
    Object? isGetTotalEstimatedTimeCompleted = null,
    Object? isGetTotalEstimatedTimeFailed = null,
    Object? isUpdateTotalEstimatedTimeLoading = null,
    Object? isUpdateTotalEstimatedTimeCompleted = null,
    Object? isUpdateTotalEstimatedTimeFailed = null,
    Object? totalEstimatedTime = null,
    Object? scrollController = freezed,
    Object? isDownloadTasksLoading = null,
    Object? isDownloadTasksCompleted = null,
    Object? isDownloadTasksFailed = null,
  }) {
    return _then(_$HomeViewmodelStateImpl(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllTasksLoading: null == isGetAllTasksLoading
          ? _value.isGetAllTasksLoading
          : isGetAllTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllTasksCompleted: null == isGetAllTasksCompleted
          ? _value.isGetAllTasksCompleted
          : isGetAllTasksCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllTasksFailed: null == isGetAllTasksFailed
          ? _value.isGetAllTasksFailed
          : isGetAllTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      allTasks: null == allTasks
          ? _value.allTasks
          : allTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchCompleted: null == isSearchCompleted
          ? _value.isSearchCompleted
          : isSearchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchFailed: null == isSearchFailed
          ? _value.isSearchFailed
          : isSearchFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedTasks: freezed == searchedTasks
          ? _value.searchedTasks
          : searchedTasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>?,
      isGetTotalEstimatedTimeLoading: null == isGetTotalEstimatedTimeLoading
          ? _value.isGetTotalEstimatedTimeLoading
          : isGetTotalEstimatedTimeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTotalEstimatedTimeCompleted: null == isGetTotalEstimatedTimeCompleted
          ? _value.isGetTotalEstimatedTimeCompleted
          : isGetTotalEstimatedTimeCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetTotalEstimatedTimeFailed: null == isGetTotalEstimatedTimeFailed
          ? _value.isGetTotalEstimatedTimeFailed
          : isGetTotalEstimatedTimeFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTotalEstimatedTimeLoading: null ==
              isUpdateTotalEstimatedTimeLoading
          ? _value.isUpdateTotalEstimatedTimeLoading
          : isUpdateTotalEstimatedTimeLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTotalEstimatedTimeCompleted: null ==
              isUpdateTotalEstimatedTimeCompleted
          ? _value.isUpdateTotalEstimatedTimeCompleted
          : isUpdateTotalEstimatedTimeCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateTotalEstimatedTimeFailed: null == isUpdateTotalEstimatedTimeFailed
          ? _value.isUpdateTotalEstimatedTimeFailed
          : isUpdateTotalEstimatedTimeFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      totalEstimatedTime: null == totalEstimatedTime
          ? _value.totalEstimatedTime
          : totalEstimatedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      scrollController: freezed == scrollController
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController?,
      isDownloadTasksLoading: null == isDownloadTasksLoading
          ? _value.isDownloadTasksLoading
          : isDownloadTasksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksCompleted: null == isDownloadTasksCompleted
          ? _value.isDownloadTasksCompleted
          : isDownloadTasksCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isDownloadTasksFailed: null == isDownloadTasksFailed
          ? _value.isDownloadTasksFailed
          : isDownloadTasksFailed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeViewmodelStateImpl implements _HomeViewmodelState {
  const _$HomeViewmodelStateImpl(
      {this.isInitial = true,
      this.isGetAllTasksLoading = false,
      this.isGetAllTasksCompleted = false,
      this.isGetAllTasksFailed = false,
      this.allTasks = const [],
      this.errorMessage = null,
      this.isSearchLoading = false,
      this.isSearchCompleted = false,
      this.isSearchFailed = false,
      this.searchedTasks = null,
      this.isGetTotalEstimatedTimeLoading = false,
      this.isGetTotalEstimatedTimeCompleted = false,
      this.isGetTotalEstimatedTimeFailed = false,
      this.isUpdateTotalEstimatedTimeLoading = false,
      this.isUpdateTotalEstimatedTimeCompleted = false,
      this.isUpdateTotalEstimatedTimeFailed = false,
      this.totalEstimatedTime = Duration.zero,
      this.scrollController = null,
      this.isDownloadTasksLoading = false,
      this.isDownloadTasksCompleted = false,
      this.isDownloadTasksFailed = false});

  @override
  @JsonKey()
  final bool isInitial;

  /// get all tasks
  @override
  @JsonKey()
  final bool isGetAllTasksLoading;
  @override
  @JsonKey()
  final bool isGetAllTasksCompleted;
  @override
  @JsonKey()
  final bool isGetAllTasksFailed;
  @override
  @JsonKey()
  final List<TaskModel> allTasks;

  /// error message
  @override
  @JsonKey()
  final String? errorMessage;

  /// search
  @override
  @JsonKey()
  final bool isSearchLoading;
  @override
  @JsonKey()
  final bool isSearchCompleted;
  @override
  @JsonKey()
  final bool isSearchFailed;
  @override
  @JsonKey()
  final List<TaskModel>? searchedTasks;

  /// get total estimated time
  @override
  @JsonKey()
  final bool isGetTotalEstimatedTimeLoading;
  @override
  @JsonKey()
  final bool isGetTotalEstimatedTimeCompleted;
  @override
  @JsonKey()
  final bool isGetTotalEstimatedTimeFailed;

  /// update total estimated time
  @override
  @JsonKey()
  final bool isUpdateTotalEstimatedTimeLoading;
  @override
  @JsonKey()
  final bool isUpdateTotalEstimatedTimeCompleted;
  @override
  @JsonKey()
  final bool isUpdateTotalEstimatedTimeFailed;
  @override
  @JsonKey()
  final Duration totalEstimatedTime;

  /// scroll controller
  @override
  @JsonKey()
  final ScrollController? scrollController;

  /// download tasks
  @override
  @JsonKey()
  final bool isDownloadTasksLoading;
  @override
  @JsonKey()
  final bool isDownloadTasksCompleted;
  @override
  @JsonKey()
  final bool isDownloadTasksFailed;

  @override
  String toString() {
    return 'HomeViewmodelState(isInitial: $isInitial, isGetAllTasksLoading: $isGetAllTasksLoading, isGetAllTasksCompleted: $isGetAllTasksCompleted, isGetAllTasksFailed: $isGetAllTasksFailed, allTasks: $allTasks, errorMessage: $errorMessage, isSearchLoading: $isSearchLoading, isSearchCompleted: $isSearchCompleted, isSearchFailed: $isSearchFailed, searchedTasks: $searchedTasks, isGetTotalEstimatedTimeLoading: $isGetTotalEstimatedTimeLoading, isGetTotalEstimatedTimeCompleted: $isGetTotalEstimatedTimeCompleted, isGetTotalEstimatedTimeFailed: $isGetTotalEstimatedTimeFailed, isUpdateTotalEstimatedTimeLoading: $isUpdateTotalEstimatedTimeLoading, isUpdateTotalEstimatedTimeCompleted: $isUpdateTotalEstimatedTimeCompleted, isUpdateTotalEstimatedTimeFailed: $isUpdateTotalEstimatedTimeFailed, totalEstimatedTime: $totalEstimatedTime, scrollController: $scrollController, isDownloadTasksLoading: $isDownloadTasksLoading, isDownloadTasksCompleted: $isDownloadTasksCompleted, isDownloadTasksFailed: $isDownloadTasksFailed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewmodelStateImpl &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isGetAllTasksLoading, isGetAllTasksLoading) ||
                other.isGetAllTasksLoading == isGetAllTasksLoading) &&
            (identical(other.isGetAllTasksCompleted, isGetAllTasksCompleted) ||
                other.isGetAllTasksCompleted == isGetAllTasksCompleted) &&
            (identical(other.isGetAllTasksFailed, isGetAllTasksFailed) ||
                other.isGetAllTasksFailed == isGetAllTasksFailed) &&
            const DeepCollectionEquality().equals(other.allTasks, allTasks) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            (identical(other.isSearchCompleted, isSearchCompleted) ||
                other.isSearchCompleted == isSearchCompleted) &&
            (identical(other.isSearchFailed, isSearchFailed) ||
                other.isSearchFailed == isSearchFailed) &&
            const DeepCollectionEquality()
                .equals(other.searchedTasks, searchedTasks) &&
            (identical(other.isGetTotalEstimatedTimeLoading, isGetTotalEstimatedTimeLoading) ||
                other.isGetTotalEstimatedTimeLoading ==
                    isGetTotalEstimatedTimeLoading) &&
            (identical(other.isGetTotalEstimatedTimeCompleted, isGetTotalEstimatedTimeCompleted) ||
                other.isGetTotalEstimatedTimeCompleted ==
                    isGetTotalEstimatedTimeCompleted) &&
            (identical(other.isGetTotalEstimatedTimeFailed, isGetTotalEstimatedTimeFailed) ||
                other.isGetTotalEstimatedTimeFailed ==
                    isGetTotalEstimatedTimeFailed) &&
            (identical(other.isUpdateTotalEstimatedTimeLoading, isUpdateTotalEstimatedTimeLoading) ||
                other.isUpdateTotalEstimatedTimeLoading ==
                    isUpdateTotalEstimatedTimeLoading) &&
            (identical(other.isUpdateTotalEstimatedTimeCompleted,
                    isUpdateTotalEstimatedTimeCompleted) ||
                other.isUpdateTotalEstimatedTimeCompleted ==
                    isUpdateTotalEstimatedTimeCompleted) &&
            (identical(other.isUpdateTotalEstimatedTimeFailed, isUpdateTotalEstimatedTimeFailed) ||
                other.isUpdateTotalEstimatedTimeFailed ==
                    isUpdateTotalEstimatedTimeFailed) &&
            (identical(other.totalEstimatedTime, totalEstimatedTime) ||
                other.totalEstimatedTime == totalEstimatedTime) &&
            (identical(other.scrollController, scrollController) ||
                other.scrollController == scrollController) &&
            (identical(other.isDownloadTasksLoading, isDownloadTasksLoading) ||
                other.isDownloadTasksLoading == isDownloadTasksLoading) &&
            (identical(other.isDownloadTasksCompleted, isDownloadTasksCompleted) ||
                other.isDownloadTasksCompleted == isDownloadTasksCompleted) &&
            (identical(other.isDownloadTasksFailed, isDownloadTasksFailed) ||
                other.isDownloadTasksFailed == isDownloadTasksFailed));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isInitial,
        isGetAllTasksLoading,
        isGetAllTasksCompleted,
        isGetAllTasksFailed,
        const DeepCollectionEquality().hash(allTasks),
        errorMessage,
        isSearchLoading,
        isSearchCompleted,
        isSearchFailed,
        const DeepCollectionEquality().hash(searchedTasks),
        isGetTotalEstimatedTimeLoading,
        isGetTotalEstimatedTimeCompleted,
        isGetTotalEstimatedTimeFailed,
        isUpdateTotalEstimatedTimeLoading,
        isUpdateTotalEstimatedTimeCompleted,
        isUpdateTotalEstimatedTimeFailed,
        totalEstimatedTime,
        scrollController,
        isDownloadTasksLoading,
        isDownloadTasksCompleted,
        isDownloadTasksFailed
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeViewmodelStateImplCopyWith<_$HomeViewmodelStateImpl> get copyWith =>
      __$$HomeViewmodelStateImplCopyWithImpl<_$HomeViewmodelStateImpl>(
          this, _$identity);
}

abstract class _HomeViewmodelState implements HomeViewmodelState {
  const factory _HomeViewmodelState(
      {final bool isInitial,
      final bool isGetAllTasksLoading,
      final bool isGetAllTasksCompleted,
      final bool isGetAllTasksFailed,
      final List<TaskModel> allTasks,
      final String? errorMessage,
      final bool isSearchLoading,
      final bool isSearchCompleted,
      final bool isSearchFailed,
      final List<TaskModel>? searchedTasks,
      final bool isGetTotalEstimatedTimeLoading,
      final bool isGetTotalEstimatedTimeCompleted,
      final bool isGetTotalEstimatedTimeFailed,
      final bool isUpdateTotalEstimatedTimeLoading,
      final bool isUpdateTotalEstimatedTimeCompleted,
      final bool isUpdateTotalEstimatedTimeFailed,
      final Duration totalEstimatedTime,
      final ScrollController? scrollController,
      final bool isDownloadTasksLoading,
      final bool isDownloadTasksCompleted,
      final bool isDownloadTasksFailed}) = _$HomeViewmodelStateImpl;

  @override
  bool get isInitial;
  @override

  /// get all tasks
  bool get isGetAllTasksLoading;
  @override
  bool get isGetAllTasksCompleted;
  @override
  bool get isGetAllTasksFailed;
  @override
  List<TaskModel> get allTasks;
  @override

  /// error message
  String? get errorMessage;
  @override

  /// search
  bool get isSearchLoading;
  @override
  bool get isSearchCompleted;
  @override
  bool get isSearchFailed;
  @override
  List<TaskModel>? get searchedTasks;
  @override

  /// get total estimated time
  bool get isGetTotalEstimatedTimeLoading;
  @override
  bool get isGetTotalEstimatedTimeCompleted;
  @override
  bool get isGetTotalEstimatedTimeFailed;
  @override

  /// update total estimated time
  bool get isUpdateTotalEstimatedTimeLoading;
  @override
  bool get isUpdateTotalEstimatedTimeCompleted;
  @override
  bool get isUpdateTotalEstimatedTimeFailed;
  @override
  Duration get totalEstimatedTime;
  @override

  /// scroll controller
  ScrollController? get scrollController;
  @override

  /// download tasks
  bool get isDownloadTasksLoading;
  @override
  bool get isDownloadTasksCompleted;
  @override
  bool get isDownloadTasksFailed;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewmodelStateImplCopyWith<_$HomeViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
