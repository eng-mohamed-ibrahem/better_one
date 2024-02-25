import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/repositories/note_repo/note_repo_interface.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel_state.dart';

class HomeViewmodel extends Cubit<HomeViewmodelState> {
  HomeViewmodel({required this.noteRepoInterface})
      : super(const HomeViewmodelState());
  final NoteRepoInterface noteRepoInterface;

  static HomeViewmodel get(context) => BlocProvider.of<HomeViewmodel>(context);

  void getNotes() async {
    emit(state.copyWith(isLoading: true));
    try {
      var result = await noteRepoInterface.getNotes();
      result.when(
        success: (notes) {
          emit(
            state.copyWith(isLoading: false, isCompleted: true, notes: notes),
          );
        },
        failure: (error) {
          emit(
            state.copyWith(
                isLoading: false, isFailed: true, errorMessage: error.message),
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void addNote(NoteModel note) async {
    emit(state.copyWith(isLoading: true));
    try {
      var result = await noteRepoInterface.addNote(note);
      result.when(
        success: (value) {
          emit(
            state.copyWith(
              isLoading: false,
              isCompleted: true,
              notes: state.notes..add(note),
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(
              isLoading: false, isFailed: true, errorMessage: error.message));
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void updateNote(int index, NoteModel newNote) async {
    emit(state.copyWith(isLoading: true));
    try {
      var result = await noteRepoInterface.updateNote(index, newNote);
      result.when(
        success: (value) {
          state.notes[index] = newNote;
          emit(
            state.copyWith(
                isLoading: false, isCompleted: true, notes: state.notes),
          );
        },
        failure: (error) {
          emit(state.copyWith(
              isLoading: false, isFailed: true, errorMessage: error.message));
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void removeNote(int index) async {
    emit(state.copyWith(isLoading: true));
    try {
      var result = await noteRepoInterface.removeNote(index);
      result.when(
        success: (value) {
          emit(
            state.copyWith(
              isLoading: false,
              isCompleted: true,
              notes: state.notes..removeAt(index),
            ),
          );
        },
        failure: (error) {
          emit(state.copyWith(
              isLoading: false, isFailed: true, errorMessage: error.message));
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
