import 'package:better_one/core/errors/failer.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';

class RemoteNoteDataSource implements NoteSource {
  RemoteNoteDataSource(this.apiConsumer);
  final ApiConsumer apiConsumer;
  @override
  Future<Result<dynamic, Failure>> addNote(NoteModel note) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() {
    throw UnimplementedError();
  }

  @override
  Future<Result<dynamic, Failure>> removeNote(int index) {
    throw UnimplementedError();
  }

  @override
  Future<Result<dynamic, Failure>> updateNote(int index, NoteModel newNote) {
    throw UnimplementedError();
  }
}
