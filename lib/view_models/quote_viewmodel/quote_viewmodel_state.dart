import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/model/quote_model/quote_model.dart';
import 'package:better_one/repositories/quote_repo/quote_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote_viewmodel.dart';
part 'quote_viewmodel_state.freezed.dart';

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
