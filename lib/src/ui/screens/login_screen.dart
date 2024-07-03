import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../logic/auth_view_model.dart';
import '../../themes/global_color.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/input.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthViewModel authViewModel = AuthViewModel();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: GlobalColor.background,
            leading: IconButton(
                icon: const Icon(Icons.close, color: GlobalColor.primary),
                onPressed: () => Navigator.pop(context)),
            title: const FaIcon(FontAwesomeIcons.twitter,
                color: GlobalColor.primary),
            centerTitle: true,
          ),
          bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: GlobalColor.greyColor))),
              height: 60,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: GlobalColor.primary),
                        onPressed: () {},
                        child: const Text('Forgot password?')),
                    CustomButtonWidget(
                        title: (!authViewModel.isNextButtonClicked.value)
                            ? 'Next'
                            : 'Login',
                        isActive: ((authViewModel.email.value.isNotEmpty &&
                                !authViewModel.isNextButtonClicked.value) ||
                            authViewModel.password.value.isNotEmpty),
                        onPressed: () async {
                          if (authViewModel.email.value.isNotEmpty) {
                            authViewModel.isNextButtonClicked.value = true;
                          }

                          if (authViewModel.email.value.isNotEmpty &&
                              authViewModel.password.value.isNotEmpty) {
                            bool state = await authViewModel.login();

                            if (state) {
                              if (context.mounted) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()));
                              }
                            }
                          }
                        })
                  ])),
          backgroundColor: GlobalColor.background,
          body: SafeArea(
              child: (authViewModel.isNextButtonClicked.value)
                  ? passwordFragment()
                  : emailFragment()),
        ));
  }

  Widget emailFragment() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const Text(
                  'To get started, first enter your phone, email, or @username',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              const SizedBox(height: 10),
              Input(
                  hintText: 'Phone, email, or username',
                  onPressed: (value) => authViewModel.email.value = value,
                  validator: (value) => '',
                  type: TextInputType.emailAddress)
            ])));
  }

  Widget passwordFragment() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const Text('Enter your password',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25)),
              const SizedBox(height: 10),
              PasswordInput(
                hintText: 'Password',
                onPressed: (value) => authViewModel.password.value = value,
                type: TextInputType.visiblePassword,
                validator: (value) => '',
              )
            ])));
  }
}
