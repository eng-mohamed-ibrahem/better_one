import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/quote_model/quote_model.dart';

abstract class QuoteSource<T> {
  Future<Result<QuoteModel, Failure>> getRandomQuote();
}
