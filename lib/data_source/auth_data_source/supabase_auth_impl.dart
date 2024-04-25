import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthImpl implements AuthInterface {
  late SupabaseClient client;
  @override
  void init() async {
    await Supabase.initialize(
      url: SupabaseStrings.url,
      anonKey: SupabaseStrings.apiKey,
    );
    client = Supabase.instance.client;
  }

  @override
  Future<ResultHandler<bool, ApiFailure>> isOnline() async {
    try {
      // if the [currentSession] is [null] so [isExpired] = true
      return ResultHandler.success(
          data: !(client.auth.currentSession?.isExpired ?? true));
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<bool, ApiFailure>> logOut() async {
    try {
      await client.auth.signOut();
      return const ResultHandler.success(data: true);
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel, ApiFailure>> logIn(
      {required String email, required String password}) async {
    try {
      var result = await client.auth
          .signInWithPassword(email: email, password: password);
      return ResultHandler.success(
        data: UserModel.fromJson(
          {
            'id': result.user!.id,
            'email': result.user!.email,
            'createdAt': result.user!.createdAt,
            'updatedAt': result.user!.updatedAt,
          },
        ),
      );
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel, ApiFailure>> signUp(
      {required String email, required String password}) async {
    try {
      var result = await client.auth.signUp(email: email, password: password);
      return ResultHandler.success(
        data: UserModel.fromJson(
          {
            'id': result.user!.id,
            'email': result.user!.email,
            'createdAt': result.user!.createdAt,
            'updatedAt': result.user!.updatedAt,
          },
        ),
      );
    } catch (e) {
      return ResultHandler.failure(
          error: ApiFailure.fromSupabaseError(message: e.toString()));
    }
  }
}
