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
      if (user!.emailVerified) {
        return ResultHandler.success(
          data: UserModel(
            id: user.uid,
            email: user.email!,
            name: user.displayName!,
            createdAt: user.metadata.creationTime!,
          ),
        );
      } else {
        return throw FirebaseAuthException(code: 'not-verified');
      }
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
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
      await user!.updateDisplayName(name);
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      return ResultHandler.success(
        data: UserModel(
          id: user.uid,
          email: user.email!,
          name: user.displayName!,
          createdAt: user.metadata.creationTime!,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }

  Future<ResultHandler<void, Failure>> verifyUserEmail() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      return const ResultHandler.success(data: null);
    } on FirebaseAuthException catch (e) {
      return ResultHandler.failure(
        error: FirebaseFailure.fromCode(e.code),
      );
    } catch (e) {
      return ResultHandler.failure(error: OtherFailure(message: e.toString()));
    }
  }
}
