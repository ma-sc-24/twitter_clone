import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../themes/global_color.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {},
        backgroundColor: GlobalColor.primary,
        shape: const CircleBorder(),
        child: const FaIcon(FontAwesomeIcons.feather, color: Colors.white));
  }
}
