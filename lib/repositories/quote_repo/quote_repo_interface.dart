import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/quote_model/quote_model.dart';

abstract class QuoteRepoInterface {
  Future<ResultHandler<QuoteModel, Failure>> getRandomQuote();
}
