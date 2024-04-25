import 'package:better_one/core/constants/end_points.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/data_source/quote_data_source/quote_source_interface.dart';
import 'package:better_one/model/quote_model/quote_model.dart';

class RemoteQuoteDataSource implements QuoteSource {
  RemoteQuoteDataSource({required this.apiConsumer});
  final ApiConsumer apiConsumer;
  @override
  Future<ResultHandler<QuoteModel, Failure>> getRandomQuote() async {
    try {
      var response = await apiConsumer.get(
        EndPoints.random,
        query: {
          'tags':
              "Imagination|Inspirational|Motivational|Opportunity|Power Quotes|Self Help|Success|Work",
        },
      );
      return response.when(
        success: (data) {
          return ResultHandler.success(data: QuoteModel.fromJson(data[0]));
        },
        failure: (error) {
          return ResultHandler.failure(error: error);
        },
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
