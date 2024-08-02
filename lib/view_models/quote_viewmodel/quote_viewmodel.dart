import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/quote_model/quote_model.dart';
import 'package:better_one/repositories/quote_repo/quote_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_viewmodel.freezed.dart';
part 'quote_viewmodel_state.dart';

class QuoteViewmodel extends Cubit<QuoteViewmodelState> {
  QuoteViewmodel({required this.quoteRepo})
      : super(const QuoteViewmodelState());
  final QuoteRepoInterface quoteRepo;

  static QuoteViewmodel get(context) =>
      BlocProvider.of<QuoteViewmodel>(context);

  /// get random quote from any data source
  void getRandomQuote() async {
    emit(state.copyWith(isLoading: true, isInitial: false));
    var result = await quoteRepo.getRandomQuote();
    result.when(
      success: (data) {
        emit(
          state.copyWith(
            isLoading: false,
            isCompleted: true,
            quote: data,
          ),
        );
      },
      failure: (error) {
        switch (error) {
          case ApiFailure(:String message):
            {
              emit(
                state.copyWith(
                  isLoading: false,
                  isFailed: true,
                  errorMessage: message,
                ),
              );
            }
          case CacheFailure(:String message):
            {
              emit(
                state.copyWith(
                  isLoading: false,
                  isFailed: true,
                  errorMessage: message,
                ),
              );
            }
          case OtherFailure(:String message):
            {
              debugPrint(message);
            }
        }
      },
    );
  }
}
