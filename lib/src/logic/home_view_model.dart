import 'package:get/get.dart';

import '../data/home_data.dart';
import '../models/post_model.dart';

class HomeViewModel {
  final HomeData homeData = HomeData();

  final String name = 'Lucía Pérez';
  final String username = 'lu.perez.123';

  final String profilePhoto =
      'https://i.pinimg.com/280x280_RS/1b/80/4f/1b804f161e7b31b98ba5b1586ea2cd4a.jpg';

  final RxString description = ''.obs;

  final RxList<PostModel> postList = RxList([]);

  void getList() async {
    postList.value = await homeData.getList();
  }

  Future<bool> tweet() async {
    final PostModel newPost = PostModel(
        name: name,
        username: username,
        description: description.value,
        profilePhoto: profilePhoto,
        time: '1m');

    return await homeData.tweet(newPost);
  }
}
