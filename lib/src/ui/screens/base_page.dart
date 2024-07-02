import 'package:flutter/material.dart';

import '../../themes/global_color.dart';
import 'home_screen.dart';
import 'others_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Material(
          elevation: 1,
          child: Container(
              color: Colors.white,
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: GlobalColor.primary,
                  controller: tabController,
                  tabs: const [
                    Tab(
                        icon: Icon(Icons.home_outlined,
                            color: GlobalColor.textColor)),
                    Tab(
                        icon: Icon(Icons.search_outlined,
                            color: GlobalColor.textColor)),
                    Tab(
                        icon: Icon(Icons.notifications_none_outlined,
                            color: GlobalColor.textColor)),
                    Tab(
                        icon: Icon(Icons.email_outlined,
                            color: GlobalColor.textColor)),
                  ])),
        ),
        body: TabBarView(controller: tabController, children: const [
          HomeScreen(),
          OthersScreen(titleScreen: 'Search Screen'),
          OthersScreen(titleScreen: 'Notification Screen'),
          OthersScreen(
            titleScreen: 'Messaging Screen',
          ),
        ]));
  }
}
