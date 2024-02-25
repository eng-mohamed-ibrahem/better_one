part of 'home_viewmodel.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HomeViewmodelState with _$HomeViewmodelState {
  const factory HomeViewmodelState({
    @Default(true) bool isInitial,
    @Default([]) List<NoteModel> notes,
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,
    @Default(false) bool isFailed,
    @Default(null) String? errorMessage,
  }) = _HomeViewmodelState;
}
