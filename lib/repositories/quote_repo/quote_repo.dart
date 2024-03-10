import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/quote_data_source/quote_source_interface.dart';
import 'package:better_one/model/quote_model/quote_model.dart';
import 'package:better_one/repositories/quote_repo/quote_interface.dart';

class QuoteRepo implements QuoteInterface {
  QuoteRepo({required this.quoteSource});
  final QuoteSource quoteSource;
  @override
  Future<Result<QuoteModel, Failure>> getRandomQuote() {
    return quoteSource.getRandomQuote();
  }
}
