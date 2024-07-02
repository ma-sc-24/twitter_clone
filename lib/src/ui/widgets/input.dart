import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../themes/global_color.dart';

class Input extends StatelessWidget {
  final String hintText;
  final Function(String) onPressed;
  final String Function(String?)? validator;
  final TextInputType type;

  final int? counter;

  const Input(
      {super.key,
      required this.hintText,
      required this.onPressed,
      required this.type,
      this.validator,
      this.counter});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: GlobalColor.primary,
        onChanged: onPressed,
        validator: validator,
        keyboardType: type,
        style: const TextStyle(color: GlobalColor.textColor),
        decoration: InputDecoration(
            counterText: (counter == null) ? null : '$counter',
            counterStyle: const TextStyle(color: GlobalColor.greyColor),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: GlobalColor.primary)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: GlobalColor.primary)),
            hintText: hintText,
            hintStyle: const TextStyle(color: GlobalColor.textColor)));
  }
}

class PasswordInput extends StatelessWidget {
  final String hintText;
  final Function(String) onPressed;
  final String Function(String?)? validator;
  final TextInputType type;

  final RxBool isShowedPassword = false.obs;

  PasswordInput(
      {super.key,
      required this.hintText,
      required this.onPressed,
      this.validator,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
        obscureText: (isShowedPassword.value) ? false : true,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: GlobalColor.primary,
        onChanged: onPressed,
        validator: validator,
        keyboardType: type,
        style: const TextStyle(color: GlobalColor.textColor),
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () =>
                    isShowedPassword.value = !isShowedPassword.value,
                icon: (isShowedPassword.value)
                    ? const FaIcon(FontAwesomeIcons.eye)
                    : const FaIcon(FontAwesomeIcons.eyeSlash),
                color: GlobalColor.greyColor),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: GlobalColor.primary)),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: GlobalColor.primary)),
            hintText: hintText,
            hintStyle: const TextStyle(color: GlobalColor.textColor))));
  }
}
