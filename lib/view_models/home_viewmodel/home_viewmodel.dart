import 'package:better_one/core/enum/note_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/repositories/note_repo/note_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import '../../core/constants/constants.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewmodel extends Cubit<HomeViewmodelState> {
  HomeViewmodel({required this.noteRepoInterface})
      : super(const HomeViewmodelState());
  final NoteRepoInterface noteRepoInterface;

  static HomeViewmodel get(context) => BlocProvider.of<HomeViewmodel>(context);

  void getNotes() async {
    release();
    emit(state.copyWith(
      isGetAllNotesLoading: true,
      isInitial: false,
    ));
    var result = await noteRepoInterface.getNotes();
    result.when(
      success: (notes) {
        emit(
          state.copyWith(
            isGetAllNotesLoading: false,
            isGetAllNotesCompleted: true,
            allNotes: notes,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isGetAllNotesLoading: false,
            isGetAllNotesCompleted: false,
            isGetAllNotesFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void addNote(NoteModel note) async {
    release();
    emit(state.copyWith(isNoteAddLoading: true));
    var result = await noteRepoInterface.addNote(note);
    result.when(
      success: (note) {
        emit(
          state.copyWith(
            isNoteAddLoading: false,
            isNoteAddCompleted: true,
            addedNote: note,
            allNotes: state.allNotes..add(note),
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isNoteAddLoading: false,
            isNoteAddCompleted: false,
            isNoteAddFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void updateNote(NoteModel oldNote, NoteModel newNote) async {
    release();
    emit(state.copyWith(isNoteUpdateLoading: true));
    int index = state.allNotes.indexOf(oldNote);
    var result = await noteRepoInterface.updateNote(oldNote, newNote);
    result.when(
      success: (updatedNote) {
        emit(
          state.copyWith(
            isNoteUpdateLoading: false,
            isNoteUpdateCompleted: true,
            updatedNote: updatedNote,
            allNotes: state.allNotes..[index] = updatedNote,
          ),
        );
      },
      failure: (error) {
        Logger().e(error.message);
        emit(
          state.copyWith(
            isNoteUpdateLoading: false,
            isNoteUpdateCompleted: false,
            isNoteUpdateFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void removeNote(NoteModel removedNote) async {
    release();
    emit(state.copyWith(isNoteRemoveLoading: true));
    var result = await noteRepoInterface.removeNote(removedNote);
    result.when(
      success: (value) {
        updateTotalEstimatedTime(removedNote.elapsedTime, isAdding: false);
        emit(
          state.copyWith(
            isNoteRemoveLoading: false,
            isNoteRemoveCompleted: true,
            removedNote: removedNote,
            allNotes: state.allNotes..remove(removedNote),
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isNoteRemoveLoading: false,
            isNoteRemoveCompleted: false,
            isNoteRemoveFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  void getNoteById(String id) async {
    release();
    emit(state.copyWith(isGetNoteByIdLoading: true, noteById: null));
    var result = await noteRepoInterface.getNoteById(id);
    result.when(
      success: (note) {
        emit(
          state.copyWith(
            isGetNoteByIdLoading: false,
            isGetNoteByIdCompleted: true,
            noteById: note,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            isGetNoteByIdLoading: false,
            isGetNoteByIdCompleted: false,
            isGetNoteByIdFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  /// update note and total estimated time on exit
  /// [plusTime] is added to note and total estimated time
  /// this happen if exit while note is in progress
  void updateNoteAndTotalEstimatedTime(
      NoteModel note, NoteStatus status, Duration plusTime) {
    updateNote(
      note,
      note.copyWith(
        elapsedTime: note.elapsedTime + plusTime,
        status: status,
      ),
    );
    updateTotalEstimatedTime(plusTime);
  }

  void getTotalEstimatedTime() async {
    release();
    // emit(state.copyWith(isGetTotalEstimatedTimeLoading: true));
    var result = await noteRepoInterface.getTotoalEstimatedTime();
    result.when(
        success: (totalTime) => emit(
              state.copyWith(
                isGetTotalEstimatedTimeLoading: false,
                isGetTotalEstimatedTimeCompleted: true,
                totalEstimatedTime: Duration(microseconds: totalTime),
              ),
            ),
        failure: (error) {
          emit(
            state.copyWith(
              isGetTotalEstimatedTimeLoading: false,
              isGetTotalEstimatedTimeCompleted: false,
              isGetTotalEstimatedTimeFailed: true,
              errorMessage: error.message,
            ),
          );
        });
  }

  void updateTotalEstimatedTime(Duration updatedTime,
      {bool isAdding = true}) async {
    release();
    // emit(state.copyWith(isUpdateTotalEstimatedTimeLoading: true));
    var result = await noteRepoInterface.updateTotalEstimatedTime(
        updatedTime.inMicroseconds, isAdding);
    result.when(
      success: (totalTime) => emit(
        state.copyWith(
          isUpdateTotalEstimatedTimeLoading: false,
          isUpdateTotalEstimatedTimeCompleted: true,
          totalEstimatedTime: Duration(microseconds: totalTime),
        ),
      ),
      failure: (error) {
        emit(
          state.copyWith(
            isUpdateTotalEstimatedTimeLoading: false,
            isUpdateTotalEstimatedTimeCompleted: false,
            isUpdateTotalEstimatedTimeFailed: true,
            errorMessage: error.message,
          ),
        );
      },
    );
  }

  /// make in notification settings page
  void scheduleNotification(String title, String body) async {
    List<int> ids = await localNotification.getActiveNotificationsIds();
    bool isScheduled =
        ids.contains(NotificaitonConstants.scheduleNotificationId);
    isScheduled
        ? null
        : await localNotification.displaySchedule(
            repeatDaysWithSameTime: true,
            scheduleTime: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
              NotificaitonConstants.scheduleNotificationInHour,
            ),
            notification: NotificationModel(
              id: NotificaitonConstants.scheduleNotificationId,
              title: title,
              body: body,
            ),
          );
  }

  /// release all states to initial state except [allNotes] and [totalEstimatedTime]
  /// i use this when navigate back from [NoteScreen] to release all states corresponding to this screen
  void release() {
    emit(
      state.copyWith(
        isNoteAddLoading: false,
        isNoteAddCompleted: false,
        isNoteAddFailed: false,
        isNoteUpdateLoading: false,
        isNoteUpdateCompleted: false,
        isNoteUpdateFailed: false,
        isNoteRemoveLoading: false,
        isNoteRemoveCompleted: false,
        isNoteRemoveFailed: false,
        isGetNoteByIdLoading: false,
        isGetNoteByIdCompleted: false,
        isGetNoteByIdFailed: false,
        errorMessage: null,
        addedNote: null,
        updatedNote: null,
        removedNote: null,
        noteById: null,
      ),
    );
  }
}
