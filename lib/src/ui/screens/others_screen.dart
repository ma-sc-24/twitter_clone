import 'package:flutter/material.dart';

class OthersScreen extends StatelessWidget {
  final String titleScreen;

  const OthersScreen({super.key, required this.titleScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(titleScreen,
                style: const TextStyle(fontSize: 30, color: Colors.black))));
  }
}
