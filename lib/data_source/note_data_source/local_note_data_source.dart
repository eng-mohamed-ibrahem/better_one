import 'dart:convert';
import 'dart:developer';

import 'package:better_one/core/constants/cache_keys.dart';
import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';

class LocalNoteDataSource implements NoteSource {
  LocalNoteDataSource(this.cacheRepo);

  /// this method which i use to execute my local data source
  final CacheMethodInterface cacheRepo;
  @override
  Future<Result<dynamic, Failure>> addNote(NoteModel note) async {
    try {
      List<NoteModel> list = _convertToNoteList(cacheRepo.get(CacheKeys.notes));
      list.add(note);
      await cacheRepo.save(CacheKeys.notes, _convertToJson(list));
      return const Result.success(data: true);
    } catch (e) {
      log(e.toString());
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() async {
    try {
      return Result.success(
        data: _convertToNoteList(cacheRepo.get(CacheKeys.notes) ??
            []), // take list of string convert it list of NoteModel
      );
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<dynamic, Failure>> removeNote(int index) async {
    try {
      List<NoteModel> list =
          _convertToNoteList(cacheRepo.get(CacheKeys.notes) ?? []);
      if (list.isNotEmpty) {
        list.removeAt(index);
        await cacheRepo.save(CacheKeys.notes, _convertToJson(list));
      }
      return const Result.success(data: true);
    } catch (e) {
      return Result.failure(error: CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<dynamic, Failure>> updateNote(
      int index, NoteModel newNote) async {
    try {
      List<NoteModel> list = _convertToNoteList(cacheRepo.get(CacheKeys.notes));
      list[index] = newNote;
      await cacheRepo.save(CacheKeys.notes, _convertToJson(list));
      return const Result.success(data: true);
    } catch (e) {
      log(e.toString());

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
