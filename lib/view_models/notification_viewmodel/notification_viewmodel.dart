import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/repositories/user_repo/user_repo_intefrace.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_viewmodel.freezed.dart';
part 'notification_viewmodel_state.dart';

class NotificationViewmodel extends Cubit<NotificationViewmodelState> {
  NotificationViewmodel({required UserRepoInterface userRepo})
      : _userRepo = userRepo,
        super(const NotificationViewmodelState.initial());
  final UserRepoInterface _userRepo;
  late final Stream<List<NotificationModel>> tasksStream;
  final List<QueryDocumentSnapshot<Object?>> list = [];

  void sendNotification(NotificationModel notification) async {
    emit(const _SendNotificationloading());
    var result = await _userRepo.sendNotification(notification);
    result.when(
      success: (_) => emit(const _SendNotificationSuccess()),
      failure: (failure) => emit(
        _SendNotificationFailed(
          failure: failure,
          message: failure.message,
        ),
      ),
    );
  }

  void getNotificationStream() async {
    emit(const _GetNotificationStreamloading());
    var result = await _userRepo.listenNotifications();
    result.when(
      success: (stream) {
        tasksStream = stream;
        emit(
          _GetNotificationStreamSuccess(stream: stream),
        );
      },
      failure: (failure) => emit(
        _GetNotificationStreamFailed(
          failure: failure,
          message: failure.message,
        ),
      ),
    );
  }

  QueryDocumentSnapshot<Object?>? lastDocument;
  void getNotification() async {
    emit(
      lastDocument == null
          ? const _GetNotificationloading()
          : const _GetNewNotificationloading(),
    );
    var result = await _userRepo.getNotifications(10, startAfter: lastDocument);
    result.when(
      success: (docs) {
        docs.isNotEmpty ? lastDocument = list.last : null;
        list.addAll(docs);
        emit(
          _GetNotificationSuccess(list: list),
        );
      },
      failure: (failure) => emit(
        _GetNotificationFailed(
          failure: failure,
          message: failure.message,
        ),
      ),
    );
  }
}
