import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/feedback_model/feedback_model.dart';

abstract class FeedbackRepoInterface {
  Future<ResultHandler<void, Failure>> sendFeedback({
    required FeedbackModel feedback,
  });

  Future<ResultHandler<List<FeedbackModel>, Failure>> getFeedbacks();
}
