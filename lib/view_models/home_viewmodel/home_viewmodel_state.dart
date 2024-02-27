part of 'home_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HomeViewmodelState with _$HomeViewmodelState {
  const factory HomeViewmodelState({
    @Default(true) bool isInitial,
    //* get all notes
    @Default(false) bool isGetAllNotesLoading,
    @Default(false) bool isGetAllNotesCompleted,
    @Default(false) bool isGetAllNotesFailed,
    @Default([]) List<NoteModel> allNotes,
    //* update note
    @Default(false) bool isNoteUpdateLoading,
    @Default(false) bool isNoteUpdateCompleted,
    @Default(false) bool isNoteUpdateFailed,
    @Default(null) NoteModel? updatedNote,
    //* remove note
    @Default(false) bool isNoteRemoveLoading,
    @Default(false) bool isNoteRemoveCompleted,
    @Default(false) bool isNoteRemoveFailed,
    @Default(null) NoteModel? removedNote,
    //* add note
    @Default(false) bool isNoteAddLoading,
    @Default(false) bool isNoteAddCompleted,
    @Default(false) bool isNoteAddFailed,
    @Default(null) NoteModel? addedNote,
    //* note by id
    @Default(false) bool isGetNoteByIdLoading,
    @Default(false) bool isGetNoteByIdCompleted,
    @Default(false) bool isGetNoteByIdFailed,
    @Default(null) NoteModel? noteById,
    //* error message
    @Default(null) String? errorMessage,
  }) = _HomeViewmodelState;
}
