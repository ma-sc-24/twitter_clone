import 'package:flutter/material.dart';

import '../../themes/global_color.dart';

class CustomStoryContainerWidget extends StatelessWidget {
  const CustomStoryContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        width: double.infinity,
        height: 60,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return GestureDetector(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                          backgroundColor: GlobalColor.primary,
                          radius: 30,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(
                                      'https://i.pinimg.com/280x280_RS/1b/80/4f/1b804f161e7b31b98ba5b1586ea2cd4a.jpg'))))),
                  onTap: () {});
            }));
  }
}
