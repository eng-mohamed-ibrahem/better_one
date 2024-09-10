import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/feedback_data_source/feedback_source_interface.dart';
import 'package:better_one/model/feedback_model/feedback_model.dart';
import 'package:better_one/repositories/feedback_repo/feedback_repo_interface.dart';

import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/network_connection/network_connection.dart';
import 'package:easy_localization/easy_localization.dart';

class FeedbackRepoImpl implements FeedbackRepoInterface {
  FeedbackRepoImpl({required this.feedbackDataSource});
  final FeedbackDataSourceInterface feedbackDataSource;

  @override
  Future<ResultHandler<List<FeedbackModel>, Failure>> getFeedbacks() {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<void, Failure>> sendFeedback(
      {required FeedbackModel feedback}) async {
    if (inject<LocaleUserInfo>().getUserIdFromLocale() == null) {
      return ResultHandler.failure(
          error: NoUserLogedInFailure(message: 'feedback.login_req'.tr()));
    }
    var connected = await NetworkConnection.isConnected();
    if (connected) {
      return await feedbackDataSource.sendFeedback(feedback: feedback);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
