import 'package:flutter/material.dart';

import '../../../themes/global_color.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final bool isActive;

  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      this.isActive = true,
      this.width = 200,
      this.backgroundColor = GlobalColor.primary,
      this.foregroundColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  (isActive) ? backgroundColor : GlobalColor.inactive,
              foregroundColor:
                  (isActive) ? foregroundColor : GlobalColor.greyColor),
          onPressed: onPressed,
          child: Text(title)),
    );
  }
}
