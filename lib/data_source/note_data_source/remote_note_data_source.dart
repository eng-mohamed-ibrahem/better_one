import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/request_result/request_result.dart';
import 'package:better_one/core/utils/api_consumer/api_consumer.dart';
import 'package:better_one/data_source/note_data_source/note_source_interface.dart';
import 'package:better_one/model/note_model/note_model.dart';

class RemoteNoteDataSource implements NoteSource {
  RemoteNoteDataSource(this.apiConsumer);
  final ApiConsumer apiConsumer;

  @override
  Future<Result<NoteModel, Failure>> addNote(NoteModel newNote) {
    throw UnimplementedError();
  }

  @override
  Future<Result<NoteModel, Failure>> getNoteById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Result<List<NoteModel>, Failure>> getNotes() {
    throw UnimplementedError();
  }

  @override
  Future<Result<NoteModel, Failure>> removeNote(NoteModel removedNote) {
    throw UnimplementedError();
  }

  @override
  Future<Result<NoteModel, Failure>> updateNote(
      NoteModel oldNote, NoteModel newNote) {
    throw UnimplementedError();
  }

  @override
  Future<Result<int, Failure>> getTotoalEstimatedTime() {
    throw UnimplementedError();
  }

  @override
  Future<Result<int, Failure>> updateTotalEstimatedTime(
      int updatedTime, bool isAdding) {
    throw UnimplementedError();
  }
}
