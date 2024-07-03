import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../data/auth_data.dart';

class AuthViewModel {
  final AuthData authData = AuthData();

  final RxString email = ''.obs;
  final RxString password = ''.obs;

  final RxBool isNextButtonClicked = false.obs;

  final RxString name = ''.obs;
  final RxString phoneOrEmail = ''.obs;
  final RxString dateOfBirth = ''.obs;

  Future<bool> login() {
    return authData.login(email.value, password.value);
  }

  void loginWithGoogle() {
    authData.signInWithGoogle();
  }

  void register() {
    authData.register(email.value, password.value);
  }

  void logout() {
    authData.logout();
  }

  User? getCurrentUser() {
    return authData.getCurrentUser();
  }

  Stream<User?> isLogged() {
    return authData.isLogged();
  }
}
