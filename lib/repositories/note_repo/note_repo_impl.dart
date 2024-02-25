import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/repositories/note_repo/note_repo_interface.dart';

class NoteRepoImpl implements NoteRepoInterface {
  NoteRepoImpl(this.dataSource);
  final NoteSource dataSource;

  @override
  Future<Result<dynamic, Failure>> addNote(NoteModel note) async {
    return await dataSource.addNote(note);
  }

  @override
  Future<Result<dynamic, Failure>> removeNote(int index) async {
    return await dataSource.removeNote(index);
  }

  @override
  Future<Result<dynamic, Failure>> updateNote(
      int index, NoteModel newNote) async {
    return await dataSource.updateNote(index, newNote);
  }

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() async {
    return await dataSource.getNotes();
  }
}
