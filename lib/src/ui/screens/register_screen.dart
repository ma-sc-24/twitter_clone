import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../logic/auth_view_model.dart';
import '../../themes/global_color.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/input.dart';
import 'base_page.dart';

class RegisterScreen extends StatelessWidget {
  final AuthViewModel authViewModel = AuthViewModel();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const FaIcon(FontAwesomeIcons.twitter,
                color: GlobalColor.primary),
            centerTitle: true,
            backgroundColor: GlobalColor.background,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: GlobalColor.primary),
                onPressed: () => Navigator.pop(context))),
        backgroundColor: GlobalColor.background,
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: GlobalColor.greyColor))),
            height: 60,
            width: double.infinity,
            child: Container(
                margin: const EdgeInsets.only(left: 200),
                child: CustomButtonWidget(
                    onPressed: () {
                      authViewModel.password.value = '12345678';

                      authViewModel.register();

                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BaseScreen()));
                    },
                    title: 'Create account'))),
        body: SafeArea(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Create account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const Spacer(),
                      Obx(() => Input(
                          hintText: 'Name',
                          onPressed: (value) =>
                              authViewModel.name.value = value,
                          type: TextInputType.name,
                          counter: authViewModel.name.value.length)),
                      Input(
                          hintText: 'Email address',
                          onPressed: (value) =>
                              authViewModel.email.value = value,
                          type: TextInputType.text),
                      Input(
                          hintText: 'Date of birth',
                          onPressed: (value) =>
                              authViewModel.dateOfBirth.value = value,
                          type: TextInputType.text),
                      const Spacer()
                    ]))));
  }
}
