import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/note_model/note_model.dart';

abstract class NoteSource {
  Future<Result<dynamic, Failure>> addNote(NoteModel note);
  Future<Result<dynamic, Failure>> removeNote(int index);
  Future<Result<dynamic, Failure>> updateNote(int index, NoteModel newNote);
  Future<Result<List<NoteModel>, Failure>> getNotes();
}
