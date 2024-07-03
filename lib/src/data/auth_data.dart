import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthData {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  Future<bool> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      log('${e.message}');
      return false;
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      log('${e.message}');
    }
    return null;
  }

  Future<bool> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return true;
    } on FirebaseAuthException catch (e) {
      log('${e.message}');
      return false;
    }
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Stream<User?> isLogged() {
    return auth.authStateChanges();
  }

  void logout() {
    if (auth.currentUser != null) {
      auth.signOut();
    }
  }
}
