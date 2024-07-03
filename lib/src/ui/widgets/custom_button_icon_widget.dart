import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonIconWidget extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final IconData icon;

  const CustomButtonIconWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
        ),
        onPressed: onPressed,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FaIcon(icon, color: Colors.white),
          Text(title, style: const TextStyle(color: Colors.white))
        ]));
  }
}
