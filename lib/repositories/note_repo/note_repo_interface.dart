import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/note_model/note_model.dart';

abstract class NoteRepoInterface {
  /// to get all user notes
  Future<Result<List<NoteModel>, Failure>> getNotes();

  /// to add new note
   Future<Result<dynamic, Failure>> addNote(NoteModel note);

  /// update note
  Future<Result<dynamic, Failure>> updateNote(int index, NoteModel newNote);

  /// remove note
  Future<Result<dynamic, Failure>> removeNote(int index);
}
