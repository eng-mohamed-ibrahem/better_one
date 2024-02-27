import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/model/note_model/note_model.dart';

abstract class NoteSource {
  Future<Result<NoteModel, Failure>> addNote(NoteModel newNote);
  Future<Result<NoteModel, Failure>> removeNote(NoteModel removedNote);
  Future<Result<NoteModel, Failure>> updateNote(
      NoteModel oldNote, NoteModel newNote);
  Future<Result<List<NoteModel>, Failure>> getNotes();
  Future<Result<NoteModel, Failure>> getNoteById(String id);
}
