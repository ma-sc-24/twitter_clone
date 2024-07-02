import 'package:flutter/material.dart';

import 'src/themes/global_theme.dart';
import 'src/ui/screens/base_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter App Clone',
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.theme(),
      // home: InitialScreen(),
      home: BaseScreen(),
    );
  }
}
