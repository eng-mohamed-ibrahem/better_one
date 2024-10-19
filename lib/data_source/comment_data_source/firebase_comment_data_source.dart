import 'package:better_one/core/constants/comment_constants.dart';
import 'package:better_one/core/constants/firebase_constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/in_memory/in_memory.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/comment_data_source/comment_data_source.dart';
import 'package:better_one/model/comment_model/comment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCommentDataSource implements CommentDataSource {
  @override
  Future<ResultHandler<CommentModel, Failure>> addComment(
      CommentModel comment) async {
    try {
      var db = FirebaseFirestore.instance;
      await db
          .collection(FirebaseConstants.comments)
          .doc(comment.taskId)
          .collection(FirebaseConstants.taskComments)
          .doc(comment.id)
          .set(comment.toJson());

      return ResultHandler.success(data: comment);
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, Failure>> deleteComment(String commentId) async {
    throw UnimplementedError();
  }

  @override
  Future<ResultHandler<List<CommentModel>, Failure>> getCommentsForTask(
    String taskId,
    int limit, {
    bool loadMore = false,
  }) async {
    try {
      var db = FirebaseFirestore.instance;
      var query = db
          .collection(FirebaseConstants.comments)
          .doc(taskId)
          .collection(FirebaseConstants.taskComments)
          .orderBy('created_at', descending: true);
      if (loadMore) {
        var lastDocument = InMemory()
            .getData<QueryDocumentSnapshot>(CommentConstants.lasDocument);
        query = query.startAfterDocument(lastDocument);
      }
      var querySnapshot = await query.limit(limit).get();

      InMemory().addData<QueryDocumentSnapshot>(
          CommentConstants.lasDocument, querySnapshot.docs.last);
      InMemory().addData<bool>(
          CommentConstants.hasMore, querySnapshot.docs.length > 10);
      return ResultHandler.success(
        data: querySnapshot.docs
            .map((e) => CommentModel.fromJson(e.data()))
            .toList(),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<CommentModel, Failure>> updateComment(
      CommentModel comment) async {
    throw UnimplementedError();
  }
}
