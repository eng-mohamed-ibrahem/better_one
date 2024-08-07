import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/result_handler/result_handler.dart';
import 'package:better_one/data_source/auth_data_source/auth_interface.dart';
import 'package:better_one/model/user_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthImpl implements AuthInterface {
  @override
  Future<ResultHandler<UserModel, Failure>> logIn(
      {required String email, required String password}) async {
    try {
      var userCredentional = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var user = userCredentional.user;
      return ResultHandler.success(
        data: UserModel(
          id: user!.uid,
          email: user.email!,
          name: user.displayName!,
          createdAt: user.metadata.creationTime!,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  @override
  Future<ResultHandler<UserModel, Failure>> signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var userCredentional = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var user = userCredentional.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        // await FirebaseAuth.instance.currentUser;
      }
      return ResultHandler.success(
        data: UserModel(
          id: user!.uid,
          email: user.email!,
          name: user.displayName!,
          createdAt: user.metadata.creationTime!,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure(
          code: e.code,
          message: e.message!,
        ),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
