import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../themes/global_color.dart';
import '../widgets/buttons/custom_floating_action_button.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/custom_story_container_widget.dart';
import '../widgets/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: const FaIcon(FontAwesomeIcons.twitter,
                color: GlobalColor.primary),
            centerTitle: true,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(75),
              child: CustomStoryContainerWidget(),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.star_border, color: GlobalColor.primary))
            ]),
        floatingActionButton: const CustomFloatingActionButton(),
        body: SafeArea(
            child: ListView.separated(
                separatorBuilder: (context, i) => const Divider(),
                itemCount: 5,
                itemBuilder: (context, i) {
                  return CustomContainerWidget(
                    name: 'Sofía',
                    username: 'sofia1234',
                    description: 'Hola hola hola hola hola',
                    profilePhoto:
                        'https://i.pinimg.com/280x280_RS/1b/80/4f/1b804f161e7b31b98ba5b1586ea2cd4a.jpg',
                    time: '1m',
                  );
                })));
  }
}
