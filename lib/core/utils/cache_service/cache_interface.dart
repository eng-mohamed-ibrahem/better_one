import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/note_model/note_model.dart';

abstract class CacheMethodInterface {
  /// init cache method
  Future<void> init();

  /// get all notes
  Future<Result<List<NoteModel>, CacheFailure>> getAllNotes();

  /// get note by id
  Future<Result<NoteModel, CacheFailure>> getNoteById(String id);

  /// add new note
  Future<Result<NoteModel, CacheFailure>> addNote(NoteModel note);

  /// update note
  Future<Result<NoteModel, CacheFailure>> updateNote(
      NoteModel oldNote, NoteModel newNote);

  /// remove note
  Future<Result<NoteModel, CacheFailure>> removeNote(NoteModel removedNote);
}
