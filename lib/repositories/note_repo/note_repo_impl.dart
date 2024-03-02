import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/repositories/note_repo/note_repo_interface.dart';

class NoteRepoImpl implements NoteRepoInterface {
  NoteRepoImpl(this.dataSource);
  final NoteSource dataSource;

  @override
  Future<Result<NoteModel, Failure>> addNote(NoteModel note) async {
    return await dataSource.addNote(note);
  }

  @override
  Future<Result<NoteModel, Failure>> removeNote(NoteModel removedNote) async {
    return await dataSource.removeNote(removedNote);
  }

  @override
  Future<Result<NoteModel, Failure>> updateNote(
      NoteModel oldNote, NoteModel newNote) async {
    return await dataSource.updateNote(oldNote, newNote);
  }

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() async {
    return await dataSource.getNotes();
  }

  @override
  Future<Result<NoteModel?, Failure>> getNoteById(String id) async {
    return await dataSource.getNoteById(id);
  }

  @override
  Future<Result<int, Failure>> getTotoalEstimatedTime() async {
    return await dataSource.getTotoalEstimatedTime();
  }

  @override
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) async {
    return await dataSource.updateTotalEstimatedTime(updatedTime, isAdding);
  }
}
