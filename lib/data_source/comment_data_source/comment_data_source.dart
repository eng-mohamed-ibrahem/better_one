import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/model/comment_model/comment_model.dart';

abstract class CommentDataSource {
  Future<ResultHandler<List<CommentModel>, Failure>> getCommentsForTask(
      String taskId, int limit,
      {bool loadMore = false});

  Future<ResultHandler<CommentModel, Failure>> addComment(CommentModel comment);

  Future<ResultHandler<CommentModel, Failure>> updateComment(
      CommentModel comment);

  Future<ResultHandler<bool, Failure>> deleteComment(String commentId, String taskId);
}
