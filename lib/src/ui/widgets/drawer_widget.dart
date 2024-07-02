import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:format_label/format_label.dart';

import '../../themes/global_color.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/280x280_RS/1b/80/4f/1b804f161e7b31b98ba5b1586ea2cd4a.jpg')),
                      const SizedBox(height: 10),
                      Text('Nombre Apeelido',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('@username',
                          style: const TextStyle(fontWeight: FontWeight.w400)),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FormatLabel(
                                mainText: '632',
                                description: 'Following',
                                descriptionTextWeight: FontWeight.bold,
                                mainTextWeight: FontWeight.normal,
                                mainTextStyle:
                                    const TextStyle(color: Colors.black),
                                descriptionTextStyle:
                                    const TextStyle(color: Colors.black)),
                            FormatLabel(
                                mainText: '632',
                                description: 'Followers',
                                descriptionTextWeight: FontWeight.bold,
                                mainTextWeight: FontWeight.normal,
                                mainTextStyle:
                                    const TextStyle(color: Colors.black),
                                descriptionTextStyle:
                                    const TextStyle(color: Colors.black))
                          ]),
                      const SizedBox(height: 20),
                      itemButton(Icons.person, 'Profile'),
                      itemButton(Icons.list, 'Lists'),
                      itemButton(FontAwesomeIcons.boltLightning, 'Moments'),
                      const Divider(color: GlobalColor.greyColor),
                      itemButton(null, 'Settings and privacy'),
                      itemButton(null, 'Help Center'),
                      const Spacer(),
                      const Divider(color: GlobalColor.greyColor),
                      itemButton(null, 'Logout')
                    ]))));
  }

  Widget itemButton(IconData? icon, String title) {
    return Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsetsDirectional.only(bottom: 10),
        child: TextButton(
            onPressed: () {},
            child: Row(children: [
              (icon != null)
                  ? Icon(icon, color: GlobalColor.textColor, size: 25)
                  : Container(),
              const SizedBox(width: 20),
              Text(title, style: const TextStyle(color: GlobalColor.textColor)),
            ])));
  }
}
