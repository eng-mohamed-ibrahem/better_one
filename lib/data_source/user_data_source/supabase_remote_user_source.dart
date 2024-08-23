// import 'package:better_one/core/constants/constants.dart';
// import 'package:better_one/core/errors/failure.dart';
// import 'package:better_one/core/result_handler/result_handler.dart';
// import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
// import 'package:better_one/data_source/user_data_source/remote_user_source.dart';
// import 'package:better_one/model/task_model/task_model.dart';
// import 'package:better_one/model/user_model/user_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class SupabaseRemoteUser implements RemoteUserSource {
//   @override
//   Future<ResultHandler<UserModel?, Failure>> getUserDetails() async {
//     try {
//       return ResultHandler.success(
//         data: isActive
//             ? UserModel.fromJson(client.userAccount.auth.currentUser!.toJson())
//             : null,
//       );
//     } on AuthException catch (e) {
//       return ResultHandler.failure(
//         error: SupabaseFailure(message: e.message),
//       );
//     } on FormatException catch (e) {
//       return ResultHandler.failure(
//         error: ParserFailure(message: e.message),
//       );
//     } catch (e) {
//       return ResultHandler.failure(
//         error: OtherFailure(message: e.toString()),
//       );
//     }
//   }

//   bool get isActive {
//     return client.userAccount.auth.currentSession == null
//         ? false
//         : !client.userAccount.auth.currentSession!.isExpired;
//   }

//   @override
//   Future<ResultHandler<bool, Failure>> logOut() async {
//     try {
//       await client.userAccount.auth.signOut();
//       return const ResultHandler.success(data: true);
//     } catch (e) {
//       return ResultHandler.failure(
//           error: SupabaseFailure(message: e.toString()));
//     }
//   }

//   @override
//   Future<ResultHandler<UserModel?, Failure>> updateUserDetails(
//       {String? newEmail, String? newPassword, String? newDisplayName}) async {
//     try {
//       UserModel? user = isActive
//           ? await client.userAccount.auth
//               .updateUser(
//                 UserAttributes(
//                   email: newEmail,
//                   password: newPassword,
//                   data: newDisplayName != null
//                       ? {"display_name": newDisplayName}
//                       : null,
//                 ),
//               )
//               .then((value) => UserModel.fromJson(value.user!.toJson()))
//           : null;
//       return ResultHandler.success(data: user);
//     } on AuthException catch (e) {
//       return ResultHandler.failure(
//         error: SupabaseFailure(message: e.message),
//       );
//     } on FormatException catch (e) {
//       return ResultHandler.failure(
//         error: ParserFailure(message: e.message),
//       );
//     } catch (e) {
//       return ResultHandler.failure(
//         error: OtherFailure(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<ResultHandler<bool, Failure>> uploadAllTasks(
//       {required List<TaskModel> tasks}) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<ResultHandler<TaskModel, Failure>> addTask(TaskModel newTask) async {
//     try {
//       await client.userAccount
//           .from(SupabaseStrings.taskTableName)
//           .insert(newTask.toJson());
//       return ResultHandler.success(data: newTask);
//     } on AuthException catch (e) {
//       return ResultHandler.failure(
//         error: SupabaseFailure(message: e.message),
//       );
//     } on FormatException catch (e) {
//       return ResultHandler.failure(
//         error: ParserFailure(message: e.message),
//       );
//     } catch (e) {
//       return ResultHandler.failure(
//         error: OtherFailure(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<ResultHandler<TaskModel, Failure>> getTaskById(String id) async {
//     try {
//       var taskJson = await client.userAccount
//           .from(SupabaseStrings.taskTableName)
//           .select()
//           .eq("id", id)
//           .single();
//       return ResultHandler.success(
//         data: TaskModel.fromJson(taskJson),
//       );
//     } on AuthException catch (e) {
//       return ResultHandler.failure(
//         error: SupabaseFailure(message: e.message),
//       );
//     } on FormatException catch (e) {
//       return ResultHandler.failure(
//         error: ParserFailure(message: e.message),
//       );
//     } catch (e) {
//       return ResultHandler.failure(
//         error: OtherFailure(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<ResultHandler<TaskModel, Failure>> removeTask(
//       TaskModel removedTask) async {
//     try {
//       var taskJson = await client.userAccount
//           .from(SupabaseStrings.taskTableName)
//           .delete()
//           .eq("id", removedTask.id)
//           .select()
//           .single();
//       return ResultHandler.success(
//         data: TaskModel.fromJson(taskJson),
//       );
//     } on AuthException catch (e) {
//       return ResultHandler.failure(
//         error: SupabaseFailure(message: e.message),
//       );
//     } on FormatException catch (e) {
//       return ResultHandler.failure(
//         error: ParserFailure(message: e.message),
//       );
//     } catch (e) {
//       return ResultHandler.failure(
//         error: OtherFailure(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<ResultHandler<TaskModel, Failure>> updateTask(
//       TaskModel oldTask, TaskModel newTask) async {
//     try {
//       var taskJson = await client.userAccount
//           .from(SupabaseStrings.taskTableName)
//           .update(newTask.toJson())
//           .eq("id", oldTask.id)
//           .single();
//       return ResultHandler.success(
//         data: TaskModel.fromJson(taskJson),
//       );
//     } on AuthException catch (e) {
//       return ResultHandler.failure(
//         error: SupabaseFailure(message: e.message),
//       );
//     } on FormatException catch (e) {
//       return ResultHandler.failure(
//         error: ParserFailure(message: e.message),
//       );
//     } catch (e) {
//       return ResultHandler.failure(
//         error: OtherFailure(message: e.toString()),
//       );
//     }
//   }
// }
