import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/cache_service/cache_interface.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';

class LocalNoteDataSource implements NoteSource {
  LocalNoteDataSource(this.cacheRepo);

  /// this method which i use to execute my local data source
  final CacheMethodInterface cacheRepo;

  /// for adding note to list and return the added note
  @override
  Future<Result<NoteModel, Failure>> addNote(NoteModel newNote) async {
    try {
      return await cacheRepo.addNote(newNote);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() async {
    try {
      var result = await cacheRepo.getAllNotes();
      return result;
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<NoteModel, Failure>> removeNote(NoteModel removedNote) async {
    try {
      return await cacheRepo.removeNote(removedNote);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<NoteModel, Failure>> updateNote(
      NoteModel oldNote, NoteModel newNote) async {
    try {
      return await cacheRepo.updateNote(oldNote, newNote);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<Result<NoteModel, Failure>> getNoteById(String id) async {
    try {
      return cacheRepo.getNoteById(id);
    } catch (e) {
      return Result.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
