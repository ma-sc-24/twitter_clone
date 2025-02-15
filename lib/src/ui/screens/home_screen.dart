import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../logic/home_view_model.dart';
import '../../themes/global_color.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/custom_story_container_widget.dart';
import '../widgets/drawer_widget.dart';
import 'tweet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();

    homeViewModel.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: const FaIcon(FontAwesomeIcons.twitter,
                color: GlobalColor.primary),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(75),
              child: CustomStoryContainerWidget(),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.star_border, color: GlobalColor.primary))
            ]),
        floatingActionButton: fab(),
        body: SafeArea(child: Obx(() {
          if (homeViewModel.postList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
                separatorBuilder: (context, i) => const Divider(),
                itemCount: homeViewModel.postList.length,
                itemBuilder: (context, i) {
                  return CustomContainerWidget(
                    name: homeViewModel.postList[i].name,
                    username: homeViewModel.postList[i].username,
                    description: homeViewModel.postList[i].description,
                    profilePhoto: homeViewModel.postList[i].profilePhoto,
                    time: homeViewModel.postList[i].time,
                  );
                });
          }
        })));
  }

  Widget fab() {
    return FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TweetScreen()))
              .then((_) => homeViewModel.getList());
        },
        backgroundColor: GlobalColor.primary,
        shape: const CircleBorder(),
        child: const FaIcon(FontAwesomeIcons.feather, color: Colors.white));
  }
}
