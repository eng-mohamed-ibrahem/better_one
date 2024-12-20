import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/core/utils/service/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/network_connection/network_connection.dart';
import 'package:better_one/data_source/comment_data_source/comment_data_source.dart';
import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:better_one/repositories/comment_repo/comment_repo.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../core/utils/dependency_locator/inject.dart';

class CommentRepoImpl implements CommentRepo {
  CommentRepoImpl({
    required CommentDataSource commentDataSource,
  }) : _commentDataSource = commentDataSource;
  final CommentDataSource _commentDataSource;

  @override
  Future<ResultHandler<CommentModel, Failure>> addComment(
      CommentModel comment) async {
    if (inject<LocaleUserInfo>().getUserData() == null) {
      return ResultHandler.failure(
          error: NoUserLogedInFailure(message: 'comment.login_req'.tr()));
    }
    if (await NetworkConnection.isConnected()) {
      return await _commentDataSource.addComment(comment);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> deleteComment(
      String commentId, String taskId) async {
    if (await NetworkConnection.isConnected()) {
      return await _commentDataSource.deleteComment(commentId, taskId);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<List<CommentModel>, Failure>> getCommentsForTask(
      String taskId, int limit,
      {bool loadMore = false}) async {
    if (inject<LocaleUserInfo>().getUserData() == null) {
      return ResultHandler.failure(
          error: NoUserLogedInFailure(message: 'comment.login_req'.tr()));
    }
    if (await NetworkConnection.isConnected()) {
      return await _commentDataSource.getCommentsForTask(taskId, limit,
          loadMore: loadMore);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }

  @override
  Future<ResultHandler<CommentModel, Failure>> updateComment(
      CommentModel comment) async {
    if (await NetworkConnection.isConnected()) {
      return await _commentDataSource.updateComment(comment);
    } else {
      return ResultHandler.failure(
          error: NoInternetFailure(message: 'core.no_intenet'.tr()));
    }
  }
}
