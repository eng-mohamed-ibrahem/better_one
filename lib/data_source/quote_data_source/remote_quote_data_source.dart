import 'package:better_one/core/constants/end_points.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/data_source/quote_data_source/quote_source_interface.dart';
import 'package:better_one/model/quote_model/quote_model.dart';

class RemoteQuoteDataSource implements QuoteSource {
  RemoteQuoteDataSource(this._apiConsumer);
  final ApiConsumer _apiConsumer;
  @override
  Future<Result<QuoteModel, Failure>> getRandomQuote() async {
    try {
      var response = await _apiConsumer.get(
        EndPoints.random,
        query: {
          'tags':
              "Imagination|Inspirational|Motivational|Opportunity|Power Quotes|Self Help|Success|Work",
        },
      );
      return response.when(
        success: (data) {
          return Result.success(data: QuoteModel.fromJson(data[0]));
        },
        failure: (error) {
          return Result.failure(error: error);
        },
      );
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
