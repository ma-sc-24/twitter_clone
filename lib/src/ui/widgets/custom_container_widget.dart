import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:format_label/format_label.dart';

import '../../themes/global_color.dart';

class CustomContainerWidget extends StatelessWidget {
  final String profilePhoto;
  final String name;
  final String username;
  final String description;
  final String time;

  final List<String>? comments;
  final int? tweets;
  final int? likes;

  const CustomContainerWidget(
      {super.key,
      required this.profilePhoto,
      required this.name,
      required this.username,
      required this.time,
      required this.description,
      this.comments,
      this.tweets,
      this.likes});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                backgroundImage: NetworkImage(profilePhoto), radius: 40),
            Container(
              width: 275,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormatLabel(
                      mainText: name,
                      description: '@$username - $time',
                      mainTextStyle:
                          const TextStyle(fontSize: 12, color: Colors.black),
                      descriptionTextStyle: const TextStyle(
                          fontSize: 12, color: GlobalColor.textColor)),
                  Text(description),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      item(FontAwesomeIcons.message, 5),
                      item(FontAwesomeIcons.retweet, 5),
                      item(FontAwesomeIcons.heart, 5),
                      item(Icons.ios_share_outlined, null),
                    ],
                  )
                ],
              ),
            ),
            const Icon(Icons.more_horiz_outlined)
          ],
        ));
  }

  Widget item(IconData icon, int? quantity) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(icon, size: 25, color: GlobalColor.greyColor)),
        const SizedBox(width: 5),
        Text('${(quantity == null) ? '' : quantity}')
      ],
    );
  }
}
