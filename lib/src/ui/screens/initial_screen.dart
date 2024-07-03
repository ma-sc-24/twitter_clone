import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:format_label/format_label.dart';

import '../../themes/global_color.dart';
import '../widgets/custom_button_icon_widget.dart';
import '../widgets/custom_button_widget.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalColor.background,
        appBar: AppBar(
          backgroundColor: GlobalColor.background,
          title: const FaIcon(FontAwesomeIcons.twitter,
              color: GlobalColor.primary),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text('See what`s happening in the world right now.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Center(
                        child: CustomButtonIconWidget(
                      title: 'Login with Google',
                      onPressed: () {},
                      icon: FontAwesomeIcons.google,
                    )),
                    const Divider(color: GlobalColor.greyColor),
                    Center(
                        child: CustomButtonWidget(
                            width: double.infinity,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegisterScreen()));
                            },
                            title: 'Create account')),
                    const SizedBox(height: 15),
                    TextButton(
                        onPressed: () {},
                        child: const FormatLabel(
                            mainText: 'By signing up, you agree to our',
                            description: 'Terms, Privacy Policy and Cookie Use',
                            mainTextStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
                            maxLines: 2,
                            descriptionTextStyle: TextStyle(
                                color: GlobalColor.primary, fontSize: 12))),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: const FormatLabel(
                            mainText: 'Have an account already?',
                            description: 'Log in',
                            mainTextWeight: FontWeight.w400,
                            descriptionTextWeight: FontWeight.w400,
                            mainTextStyle:
                                TextStyle(color: Colors.white, fontSize: 13),
                            descriptionTextStyle: TextStyle(
                                color: GlobalColor.primary, fontSize: 13))),
                    const SizedBox(height: 20)
                  ])),
        ));
  }
}
