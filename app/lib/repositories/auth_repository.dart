import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

/// [AuthRepository] is a class that is responsible for handling all the authentication related operations.
class AuthRepository {
  /// [AuthRepository] constructor.
  AuthRepository();

  UserCredential? _userCredential;

  /// [login] is a method that logs in the user.
  Future<void> login({required String password, required String? username}) async {
    if (username == null) {
      throw Exception('Username and email cannot be null');
    }
    try {
      _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        printError(info: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        printError(info: 'Wrong password provided for that user.');
      }
    }
  }

  /// [register] is a method that registers the user.
  Future<void> register({required String password, required String? username, required String? email}) async {
    if (username == null && email == null) {
      throw Exception('Username and email cannot be null');
    }
    try {
      _userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        printError(info: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        printError(info: 'The account already exists for that email.');
      }
    }
    // GetIt.I.signalReady(this);
  }

  /// [userCredential] returns the user's credential.
  UserCredential? get userCredential => _userCredential;

  /// [recoverPassword] is a method that recovers the user's password.
  static Future<void> recoverPassword({required String login}) async {
    if (login.isEmpty) {
      throw Exception('Login cannot be empty');
    }
    await FirebaseAuth.instance.sendPasswordResetEmail(email: login);
  }
}
