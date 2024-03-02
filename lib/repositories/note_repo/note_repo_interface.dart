import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/note_model/note_model.dart';

abstract class NoteRepoInterface {
  /// to get all user notes
  Future<Result<List<NoteModel>, Failure>> getNotes();

  ///get note by id
  Future<Result<NoteModel?, Failure>> getNoteById(String id);

  /// to add new note
  Future<Result<NoteModel, Failure>> addNote(NoteModel note);

  /// update note
  Future<Result<NoteModel, Failure>> updateNote(
      NoteModel oldNote, NoteModel newNote);

  /// remove note
  Future<Result<NoteModel, Failure>> removeNote(NoteModel removedNote);

  /// get total estimated time
  Future<Result<int, Failure>> getTotoalEstimatedTime();

  /// update total estimated time
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding);
}
