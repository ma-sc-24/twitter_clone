import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/themes/global_theme.dart';
import 'src/ui/screens/base_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCpicinoH9dMjk85tdcFwxHsP_k3VwwYvs',
          appId: 'twitter-clone-14504',
          messagingSenderId: '',
          projectId: 'twitter-clone-14504',
          storageBucket: 'twitter-clone-14504.appspot.com'));
  await FirebaseAppCheck.instance.activate();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter App Clone',
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.theme(),
      home: const BaseScreen(),
    );
  }
}
