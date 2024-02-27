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
  bool get isInitial => throw _privateConstructorUsedError; //* get all notes
  bool get isGetAllNotesLoading => throw _privateConstructorUsedError;
  bool get isGetAllNotesCompleted => throw _privateConstructorUsedError;
  bool get isGetAllNotesFailed => throw _privateConstructorUsedError;
  List<NoteModel> get allNotes =>
      throw _privateConstructorUsedError; //* update note
  bool get isNoteUpdateLoading => throw _privateConstructorUsedError;
  bool get isNoteUpdateCompleted => throw _privateConstructorUsedError;
  bool get isNoteUpdateFailed => throw _privateConstructorUsedError;
  NoteModel? get updatedNote =>
      throw _privateConstructorUsedError; //* remove note
  bool get isNoteRemoveLoading => throw _privateConstructorUsedError;
  bool get isNoteRemoveCompleted => throw _privateConstructorUsedError;
  bool get isNoteRemoveFailed => throw _privateConstructorUsedError;
  NoteModel? get removedNote => throw _privateConstructorUsedError; //* add note
  bool get isNoteAddLoading => throw _privateConstructorUsedError;
  bool get isNoteAddCompleted => throw _privateConstructorUsedError;
  bool get isNoteAddFailed => throw _privateConstructorUsedError;
  NoteModel? get addedNote => throw _privateConstructorUsedError; //* note by id
  bool get isGetNoteByIdLoading => throw _privateConstructorUsedError;
  bool get isGetNoteByIdCompleted => throw _privateConstructorUsedError;
  bool get isGetNoteByIdFailed => throw _privateConstructorUsedError;
  NoteModel? get noteById =>
      throw _privateConstructorUsedError; //* error message
  String? get errorMessage => throw _privateConstructorUsedError;

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
      bool isGetAllNotesLoading,
      bool isGetAllNotesCompleted,
      bool isGetAllNotesFailed,
      List<NoteModel> allNotes,
      bool isNoteUpdateLoading,
      bool isNoteUpdateCompleted,
      bool isNoteUpdateFailed,
      NoteModel? updatedNote,
      bool isNoteRemoveLoading,
      bool isNoteRemoveCompleted,
      bool isNoteRemoveFailed,
      NoteModel? removedNote,
      bool isNoteAddLoading,
      bool isNoteAddCompleted,
      bool isNoteAddFailed,
      NoteModel? addedNote,
      bool isGetNoteByIdLoading,
      bool isGetNoteByIdCompleted,
      bool isGetNoteByIdFailed,
      NoteModel? noteById,
      String? errorMessage});

  $NoteModelCopyWith<$Res>? get updatedNote;
  $NoteModelCopyWith<$Res>? get removedNote;
  $NoteModelCopyWith<$Res>? get addedNote;
  $NoteModelCopyWith<$Res>? get noteById;
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
    Object? isGetAllNotesLoading = null,
    Object? isGetAllNotesCompleted = null,
    Object? isGetAllNotesFailed = null,
    Object? allNotes = null,
    Object? isNoteUpdateLoading = null,
    Object? isNoteUpdateCompleted = null,
    Object? isNoteUpdateFailed = null,
    Object? updatedNote = freezed,
    Object? isNoteRemoveLoading = null,
    Object? isNoteRemoveCompleted = null,
    Object? isNoteRemoveFailed = null,
    Object? removedNote = freezed,
    Object? isNoteAddLoading = null,
    Object? isNoteAddCompleted = null,
    Object? isNoteAddFailed = null,
    Object? addedNote = freezed,
    Object? isGetNoteByIdLoading = null,
    Object? isGetNoteByIdCompleted = null,
    Object? isGetNoteByIdFailed = null,
    Object? noteById = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllNotesLoading: null == isGetAllNotesLoading
          ? _value.isGetAllNotesLoading
          : isGetAllNotesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllNotesCompleted: null == isGetAllNotesCompleted
          ? _value.isGetAllNotesCompleted
          : isGetAllNotesCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllNotesFailed: null == isGetAllNotesFailed
          ? _value.isGetAllNotesFailed
          : isGetAllNotesFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      allNotes: null == allNotes
          ? _value.allNotes
          : allNotes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
      isNoteUpdateLoading: null == isNoteUpdateLoading
          ? _value.isNoteUpdateLoading
          : isNoteUpdateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteUpdateCompleted: null == isNoteUpdateCompleted
          ? _value.isNoteUpdateCompleted
          : isNoteUpdateCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteUpdateFailed: null == isNoteUpdateFailed
          ? _value.isNoteUpdateFailed
          : isNoteUpdateFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedNote: freezed == updatedNote
          ? _value.updatedNote
          : updatedNote // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      isNoteRemoveLoading: null == isNoteRemoveLoading
          ? _value.isNoteRemoveLoading
          : isNoteRemoveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteRemoveCompleted: null == isNoteRemoveCompleted
          ? _value.isNoteRemoveCompleted
          : isNoteRemoveCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteRemoveFailed: null == isNoteRemoveFailed
          ? _value.isNoteRemoveFailed
          : isNoteRemoveFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      removedNote: freezed == removedNote
          ? _value.removedNote
          : removedNote // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      isNoteAddLoading: null == isNoteAddLoading
          ? _value.isNoteAddLoading
          : isNoteAddLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteAddCompleted: null == isNoteAddCompleted
          ? _value.isNoteAddCompleted
          : isNoteAddCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteAddFailed: null == isNoteAddFailed
          ? _value.isNoteAddFailed
          : isNoteAddFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      addedNote: freezed == addedNote
          ? _value.addedNote
          : addedNote // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      isGetNoteByIdLoading: null == isGetNoteByIdLoading
          ? _value.isGetNoteByIdLoading
          : isGetNoteByIdLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetNoteByIdCompleted: null == isGetNoteByIdCompleted
          ? _value.isGetNoteByIdCompleted
          : isGetNoteByIdCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetNoteByIdFailed: null == isGetNoteByIdFailed
          ? _value.isGetNoteByIdFailed
          : isGetNoteByIdFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noteById: freezed == noteById
          ? _value.noteById
          : noteById // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteModelCopyWith<$Res>? get updatedNote {
    if (_value.updatedNote == null) {
      return null;
    }

    return $NoteModelCopyWith<$Res>(_value.updatedNote!, (value) {
      return _then(_value.copyWith(updatedNote: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteModelCopyWith<$Res>? get removedNote {
    if (_value.removedNote == null) {
      return null;
    }

    return $NoteModelCopyWith<$Res>(_value.removedNote!, (value) {
      return _then(_value.copyWith(removedNote: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteModelCopyWith<$Res>? get addedNote {
    if (_value.addedNote == null) {
      return null;
    }

    return $NoteModelCopyWith<$Res>(_value.addedNote!, (value) {
      return _then(_value.copyWith(addedNote: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NoteModelCopyWith<$Res>? get noteById {
    if (_value.noteById == null) {
      return null;
    }

    return $NoteModelCopyWith<$Res>(_value.noteById!, (value) {
      return _then(_value.copyWith(noteById: value) as $Val);
    });
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
      bool isGetAllNotesLoading,
      bool isGetAllNotesCompleted,
      bool isGetAllNotesFailed,
      List<NoteModel> allNotes,
      bool isNoteUpdateLoading,
      bool isNoteUpdateCompleted,
      bool isNoteUpdateFailed,
      NoteModel? updatedNote,
      bool isNoteRemoveLoading,
      bool isNoteRemoveCompleted,
      bool isNoteRemoveFailed,
      NoteModel? removedNote,
      bool isNoteAddLoading,
      bool isNoteAddCompleted,
      bool isNoteAddFailed,
      NoteModel? addedNote,
      bool isGetNoteByIdLoading,
      bool isGetNoteByIdCompleted,
      bool isGetNoteByIdFailed,
      NoteModel? noteById,
      String? errorMessage});

  @override
  $NoteModelCopyWith<$Res>? get updatedNote;
  @override
  $NoteModelCopyWith<$Res>? get removedNote;
  @override
  $NoteModelCopyWith<$Res>? get addedNote;
  @override
  $NoteModelCopyWith<$Res>? get noteById;
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
    Object? isGetAllNotesLoading = null,
    Object? isGetAllNotesCompleted = null,
    Object? isGetAllNotesFailed = null,
    Object? allNotes = null,
    Object? isNoteUpdateLoading = null,
    Object? isNoteUpdateCompleted = null,
    Object? isNoteUpdateFailed = null,
    Object? updatedNote = freezed,
    Object? isNoteRemoveLoading = null,
    Object? isNoteRemoveCompleted = null,
    Object? isNoteRemoveFailed = null,
    Object? removedNote = freezed,
    Object? isNoteAddLoading = null,
    Object? isNoteAddCompleted = null,
    Object? isNoteAddFailed = null,
    Object? addedNote = freezed,
    Object? isGetNoteByIdLoading = null,
    Object? isGetNoteByIdCompleted = null,
    Object? isGetNoteByIdFailed = null,
    Object? noteById = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$HomeViewmodelStateImpl(
      isInitial: null == isInitial
          ? _value.isInitial
          : isInitial // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllNotesLoading: null == isGetAllNotesLoading
          ? _value.isGetAllNotesLoading
          : isGetAllNotesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllNotesCompleted: null == isGetAllNotesCompleted
          ? _value.isGetAllNotesCompleted
          : isGetAllNotesCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetAllNotesFailed: null == isGetAllNotesFailed
          ? _value.isGetAllNotesFailed
          : isGetAllNotesFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      allNotes: null == allNotes
          ? _value.allNotes
          : allNotes // ignore: cast_nullable_to_non_nullable
              as List<NoteModel>,
      isNoteUpdateLoading: null == isNoteUpdateLoading
          ? _value.isNoteUpdateLoading
          : isNoteUpdateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteUpdateCompleted: null == isNoteUpdateCompleted
          ? _value.isNoteUpdateCompleted
          : isNoteUpdateCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteUpdateFailed: null == isNoteUpdateFailed
          ? _value.isNoteUpdateFailed
          : isNoteUpdateFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedNote: freezed == updatedNote
          ? _value.updatedNote
          : updatedNote // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      isNoteRemoveLoading: null == isNoteRemoveLoading
          ? _value.isNoteRemoveLoading
          : isNoteRemoveLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteRemoveCompleted: null == isNoteRemoveCompleted
          ? _value.isNoteRemoveCompleted
          : isNoteRemoveCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteRemoveFailed: null == isNoteRemoveFailed
          ? _value.isNoteRemoveFailed
          : isNoteRemoveFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      removedNote: freezed == removedNote
          ? _value.removedNote
          : removedNote // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      isNoteAddLoading: null == isNoteAddLoading
          ? _value.isNoteAddLoading
          : isNoteAddLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteAddCompleted: null == isNoteAddCompleted
          ? _value.isNoteAddCompleted
          : isNoteAddCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isNoteAddFailed: null == isNoteAddFailed
          ? _value.isNoteAddFailed
          : isNoteAddFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      addedNote: freezed == addedNote
          ? _value.addedNote
          : addedNote // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      isGetNoteByIdLoading: null == isGetNoteByIdLoading
          ? _value.isGetNoteByIdLoading
          : isGetNoteByIdLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetNoteByIdCompleted: null == isGetNoteByIdCompleted
          ? _value.isGetNoteByIdCompleted
          : isGetNoteByIdCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isGetNoteByIdFailed: null == isGetNoteByIdFailed
          ? _value.isGetNoteByIdFailed
          : isGetNoteByIdFailed // ignore: cast_nullable_to_non_nullable
              as bool,
      noteById: freezed == noteById
          ? _value.noteById
          : noteById // ignore: cast_nullable_to_non_nullable
              as NoteModel?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomeViewmodelStateImpl implements _HomeViewmodelState {
  const _$HomeViewmodelStateImpl(
      {this.isInitial = true,
      this.isGetAllNotesLoading = false,
      this.isGetAllNotesCompleted = false,
      this.isGetAllNotesFailed = false,
      this.allNotes = const [],
      this.isNoteUpdateLoading = false,
      this.isNoteUpdateCompleted = false,
      this.isNoteUpdateFailed = false,
      this.updatedNote = null,
      this.isNoteRemoveLoading = false,
      this.isNoteRemoveCompleted = false,
      this.isNoteRemoveFailed = false,
      this.removedNote = null,
      this.isNoteAddLoading = false,
      this.isNoteAddCompleted = false,
      this.isNoteAddFailed = false,
      this.addedNote = null,
      this.isGetNoteByIdLoading = false,
      this.isGetNoteByIdCompleted = false,
      this.isGetNoteByIdFailed = false,
      this.noteById = null,
      this.errorMessage = null});

  @override
  @JsonKey()
  final bool isInitial;
//* get all notes
  @override
  @JsonKey()
  final bool isGetAllNotesLoading;
  @override
  @JsonKey()
  final bool isGetAllNotesCompleted;
  @override
  @JsonKey()
  final bool isGetAllNotesFailed;
  @override
  @JsonKey()
  final List<NoteModel> allNotes;
//* update note
  @override
  @JsonKey()
  final bool isNoteUpdateLoading;
  @override
  @JsonKey()
  final bool isNoteUpdateCompleted;
  @override
  @JsonKey()
  final bool isNoteUpdateFailed;
  @override
  @JsonKey()
  final NoteModel? updatedNote;
//* remove note
  @override
  @JsonKey()
  final bool isNoteRemoveLoading;
  @override
  @JsonKey()
  final bool isNoteRemoveCompleted;
  @override
  @JsonKey()
  final bool isNoteRemoveFailed;
  @override
  @JsonKey()
  final NoteModel? removedNote;
//* add note
  @override
  @JsonKey()
  final bool isNoteAddLoading;
  @override
  @JsonKey()
  final bool isNoteAddCompleted;
  @override
  @JsonKey()
  final bool isNoteAddFailed;
  @override
  @JsonKey()
  final NoteModel? addedNote;
//* note by id
  @override
  @JsonKey()
  final bool isGetNoteByIdLoading;
  @override
  @JsonKey()
  final bool isGetNoteByIdCompleted;
  @override
  @JsonKey()
  final bool isGetNoteByIdFailed;
  @override
  @JsonKey()
  final NoteModel? noteById;
//* error message
  @override
  @JsonKey()
  final String? errorMessage;

  @override
  String toString() {
    return 'HomeViewmodelState(isInitial: $isInitial, isGetAllNotesLoading: $isGetAllNotesLoading, isGetAllNotesCompleted: $isGetAllNotesCompleted, isGetAllNotesFailed: $isGetAllNotesFailed, allNotes: $allNotes, isNoteUpdateLoading: $isNoteUpdateLoading, isNoteUpdateCompleted: $isNoteUpdateCompleted, isNoteUpdateFailed: $isNoteUpdateFailed, updatedNote: $updatedNote, isNoteRemoveLoading: $isNoteRemoveLoading, isNoteRemoveCompleted: $isNoteRemoveCompleted, isNoteRemoveFailed: $isNoteRemoveFailed, removedNote: $removedNote, isNoteAddLoading: $isNoteAddLoading, isNoteAddCompleted: $isNoteAddCompleted, isNoteAddFailed: $isNoteAddFailed, addedNote: $addedNote, isGetNoteByIdLoading: $isGetNoteByIdLoading, isGetNoteByIdCompleted: $isGetNoteByIdCompleted, isGetNoteByIdFailed: $isGetNoteByIdFailed, noteById: $noteById, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeViewmodelStateImpl &&
            (identical(other.isInitial, isInitial) ||
                other.isInitial == isInitial) &&
            (identical(other.isGetAllNotesLoading, isGetAllNotesLoading) ||
                other.isGetAllNotesLoading == isGetAllNotesLoading) &&
            (identical(other.isGetAllNotesCompleted, isGetAllNotesCompleted) ||
                other.isGetAllNotesCompleted == isGetAllNotesCompleted) &&
            (identical(other.isGetAllNotesFailed, isGetAllNotesFailed) ||
                other.isGetAllNotesFailed == isGetAllNotesFailed) &&
            const DeepCollectionEquality().equals(other.allNotes, allNotes) &&
            (identical(other.isNoteUpdateLoading, isNoteUpdateLoading) ||
                other.isNoteUpdateLoading == isNoteUpdateLoading) &&
            (identical(other.isNoteUpdateCompleted, isNoteUpdateCompleted) ||
                other.isNoteUpdateCompleted == isNoteUpdateCompleted) &&
            (identical(other.isNoteUpdateFailed, isNoteUpdateFailed) ||
                other.isNoteUpdateFailed == isNoteUpdateFailed) &&
            (identical(other.updatedNote, updatedNote) ||
                other.updatedNote == updatedNote) &&
            (identical(other.isNoteRemoveLoading, isNoteRemoveLoading) ||
                other.isNoteRemoveLoading == isNoteRemoveLoading) &&
            (identical(other.isNoteRemoveCompleted, isNoteRemoveCompleted) ||
                other.isNoteRemoveCompleted == isNoteRemoveCompleted) &&
            (identical(other.isNoteRemoveFailed, isNoteRemoveFailed) ||
                other.isNoteRemoveFailed == isNoteRemoveFailed) &&
            (identical(other.removedNote, removedNote) ||
                other.removedNote == removedNote) &&
            (identical(other.isNoteAddLoading, isNoteAddLoading) ||
                other.isNoteAddLoading == isNoteAddLoading) &&
            (identical(other.isNoteAddCompleted, isNoteAddCompleted) ||
                other.isNoteAddCompleted == isNoteAddCompleted) &&
            (identical(other.isNoteAddFailed, isNoteAddFailed) ||
                other.isNoteAddFailed == isNoteAddFailed) &&
            (identical(other.addedNote, addedNote) ||
                other.addedNote == addedNote) &&
            (identical(other.isGetNoteByIdLoading, isGetNoteByIdLoading) ||
                other.isGetNoteByIdLoading == isGetNoteByIdLoading) &&
            (identical(other.isGetNoteByIdCompleted, isGetNoteByIdCompleted) ||
                other.isGetNoteByIdCompleted == isGetNoteByIdCompleted) &&
            (identical(other.isGetNoteByIdFailed, isGetNoteByIdFailed) ||
                other.isGetNoteByIdFailed == isGetNoteByIdFailed) &&
            (identical(other.noteById, noteById) ||
                other.noteById == noteById) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isInitial,
        isGetAllNotesLoading,
        isGetAllNotesCompleted,
        isGetAllNotesFailed,
        const DeepCollectionEquality().hash(allNotes),
        isNoteUpdateLoading,
        isNoteUpdateCompleted,
        isNoteUpdateFailed,
        updatedNote,
        isNoteRemoveLoading,
        isNoteRemoveCompleted,
        isNoteRemoveFailed,
        removedNote,
        isNoteAddLoading,
        isNoteAddCompleted,
        isNoteAddFailed,
        addedNote,
        isGetNoteByIdLoading,
        isGetNoteByIdCompleted,
        isGetNoteByIdFailed,
        noteById,
        errorMessage
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
      final bool isGetAllNotesLoading,
      final bool isGetAllNotesCompleted,
      final bool isGetAllNotesFailed,
      final List<NoteModel> allNotes,
      final bool isNoteUpdateLoading,
      final bool isNoteUpdateCompleted,
      final bool isNoteUpdateFailed,
      final NoteModel? updatedNote,
      final bool isNoteRemoveLoading,
      final bool isNoteRemoveCompleted,
      final bool isNoteRemoveFailed,
      final NoteModel? removedNote,
      final bool isNoteAddLoading,
      final bool isNoteAddCompleted,
      final bool isNoteAddFailed,
      final NoteModel? addedNote,
      final bool isGetNoteByIdLoading,
      final bool isGetNoteByIdCompleted,
      final bool isGetNoteByIdFailed,
      final NoteModel? noteById,
      final String? errorMessage}) = _$HomeViewmodelStateImpl;

  @override
  bool get isInitial;
  @override //* get all notes
  bool get isGetAllNotesLoading;
  @override
  bool get isGetAllNotesCompleted;
  @override
  bool get isGetAllNotesFailed;
  @override
  List<NoteModel> get allNotes;
  @override //* update note
  bool get isNoteUpdateLoading;
  @override
  bool get isNoteUpdateCompleted;
  @override
  bool get isNoteUpdateFailed;
  @override
  NoteModel? get updatedNote;
  @override //* remove note
  bool get isNoteRemoveLoading;
  @override
  bool get isNoteRemoveCompleted;
  @override
  bool get isNoteRemoveFailed;
  @override
  NoteModel? get removedNote;
  @override //* add note
  bool get isNoteAddLoading;
  @override
  bool get isNoteAddCompleted;
  @override
  bool get isNoteAddFailed;
  @override
  NoteModel? get addedNote;
  @override //* note by id
  bool get isGetNoteByIdLoading;
  @override
  bool get isGetNoteByIdCompleted;
  @override
  bool get isGetNoteByIdFailed;
  @override
  NoteModel? get noteById;
  @override //* error message
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$HomeViewmodelStateImplCopyWith<_$HomeViewmodelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
