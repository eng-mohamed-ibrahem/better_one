import 'dart:convert';

import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveImpl implements CacheMethodInterface {
  static const String _userdata = 'user_data';
  late final Box _appBox;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    _appBox = await Hive.openBox(_userdata);
  }

  @override
  Future<Result<NoteModel, CacheFailure>> addNote(NoteModel note) async {
    try {
      var result = await getAllNotes();
      return result.when(
        success: (notes) async {
          notes.add(note);
          await _appBox.put(CacheKeys.notes, _convertToJson(notes));
          return Result.success(data: note);
        },
        failure: (failure) {
          return Result.failure(error: failure);
        },
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<NoteModel>, CacheFailure>> getAllNotes() async {
    try {
      return Result.success(
          data: _convertToNoteList(_appBox.get(CacheKeys.notes)));
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<NoteModel, CacheFailure>> getNoteById(String id) async {
    try {
      var result = await getAllNotes();
      return result.when(
        success: (notes) {
          return Result.success(
            data: notes.firstWhere(
              (noteModel) => noteModel.id == id,
            ),
          );
        },
        failure: (error) {
          return Result.failure(error: error);
        },
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<NoteModel, CacheFailure>> removeNote(
      NoteModel removedNote) async {
    try {
      var result = await getAllNotes();
      return result.when(
        success: (notes) async {
          notes.remove(removedNote);
          await _appBox.put(CacheKeys.notes, _convertToJson(notes));
          return Result.success(data: removedNote);
        },
        failure: (failure) {
          return Result.failure(error: failure);
        },
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<NoteModel, CacheFailure>> updateNote(
      NoteModel oldNote, NoteModel newNote) async {
    try {
      var result = await getAllNotes();
      return result.when(
        success: (notes) async {
          int index = notes.indexOf(oldNote);
          notes[index] = newNote;
          await _appBox.put(CacheKeys.notes, _convertToJson(notes));
          return Result.success(data: newNote);
        },
        failure: (failure) {
          return Result.failure(error: failure);
        },
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  List<NoteModel> _convertToNoteList(List<dynamic>? list) {
    return list == null
        ? []
        : list.map((e) => NoteModel.fromJson(jsonDecode(e))).toList();
  }

  List<String> _convertToJson(List<NoteModel> list) {
    return list.map((e) => jsonEncode(e.toJson())).toList();
  }
}
