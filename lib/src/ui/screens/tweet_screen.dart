import 'package:flutter/material.dart';

import '../../logic/home_view_model.dart';
import '../../themes/global_color.dart';
import '../widgets/custom_button_widget.dart';

class TweetScreen extends StatelessWidget {
  final HomeViewModel homeViewModel = HomeViewModel();

  TweetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: GlobalColor.primary)),
            actions: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomButtonWidget(
                      width: 100,
                      onPressed: () {
                        homeViewModel.tweet();

                        Future.delayed(const Duration(milliseconds: 200));

                        Navigator.pop(context);
                      },
                      title: 'Publish'))
            ]),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: GlobalColor.primary,
                  onChanged: (value) => homeViewModel.description.value = value,
                  maxLines: 10,
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Write something...',
                      hintStyle: TextStyle(color: GlobalColor.textColor)),
                ))));
  }
}
