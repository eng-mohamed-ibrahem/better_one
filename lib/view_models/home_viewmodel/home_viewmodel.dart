import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/repositories/note_repo/note_repo_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants/constants.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewmodel extends Cubit<HomeViewmodelState> {
  HomeViewmodel({required this.noteRepoInterface})
      : super(const HomeViewmodelState());
  final NoteRepoInterface noteRepoInterface;

  static HomeViewmodel get(context) => BlocProvider.of<HomeViewmodel>(context);

  void getNotes() async {
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
    emit(state.copyWith(isNoteUpdateLoading: true));
    var result = await noteRepoInterface.updateNote(oldNote, newNote);
    result.when(
      success: (updatedNote) {
        int index = state.allNotes.indexOf(oldNote);
        emit(
          state.copyWith(
            isNoteUpdateLoading: false,
            isNoteUpdateCompleted: true,
            updatedNote: updatedNote,
            allNotes: state.allNotes..[index] = newNote,
          ),
        );
      },
      failure: (error) {
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
    emit(state.copyWith(isNoteRemoveLoading: true));
    var result = await noteRepoInterface.removeNote(removedNote);
    result.when(
      success: (value) {
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

  /// release all states to initial state except [allNotes]
  /// i use this when move to [NoteScreen]
  void release() {
    emit(state.copyWith(
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
    ));
  }
}
