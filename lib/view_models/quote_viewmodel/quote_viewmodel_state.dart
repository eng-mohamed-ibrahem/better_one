part of 'quote_viewmodel.dart';

@freezed
class QuoteViewmodelState with _$QuoteViewmodelState {
  const factory QuoteViewmodelState({
    @Default(true) bool isInitial,
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,
    @Default(null) QuoteModel? quote,
    @Default(false) bool isFailed,
    @Default(null) String? errorMessage,
  }) = _QuoteViewmodelState;
}
