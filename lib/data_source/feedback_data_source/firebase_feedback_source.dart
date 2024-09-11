import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/data_source/feedback_data_source/feedback_source_interface.dart';
import 'package:better_one/model/feedback_model/feedback_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FirebaseFeedbackSource implements FeedbackDataSourceInterface {
  @override
  Future<ResultHandler<List<FeedbackModel>, Failure>> getFeedbacks() {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<void, Failure>> sendFeedback(
      {required FeedbackModel feedback}) async {
    try {
      String? userId = inject<LocaleUserInfo>().getUserIdFromLocale();
      var db = FirebaseFirestore.instance;
      db
          .collection(FirebaseConstants.feedbacks)
          .doc(userId)
          .collection(FirebaseConstants.userFeedbacks)
          .add(feedback.toJson());

      var feedbackBody =
          '''Hi Better One Team,\nI hope this message finds you well.\n\nI wanted to share some feedback about your Better One, "${feedback.feedbackCat.name}" category.\n\n${feedback.feedback}\n\nBest regards,\n"${feedback.userName}"''';
      await FlutterEmailSender.send(
        Email(
          subject: "Better One Feedback/ ${feedback.userName}",
          recipients: ["mohamed.data13@gmail.com"],
          body: feedbackBody,
          // attachmentPaths: ['/path/to/attachment.zip'],
          isHTML: false,
        ),
      );
      return const ResultHandler.success(data: null);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
