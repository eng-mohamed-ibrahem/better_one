part of 'search_viewmodel.dart';

@freezed
class SearchViewmodelState with _$SearchViewmodelState {
  const factory SearchViewmodelState.initial() = _Initial;
/// search
  const factory SearchViewmodelState.searchLoading() = _SearchLoading;
  const factory SearchViewmodelState.searchCompleted(
      {required List<TaskModel> searchedTasks}) = _SearchCompleted;
  const factory SearchViewmodelState.searchFailed({required String message}) =
      _SearchFailed;


}
