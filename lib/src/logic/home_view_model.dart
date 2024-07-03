import 'package:get/get.dart';

import '../data/home_data.dart';
import '../models/post_model.dart';

class HomeViewModel {
  final HomeData homeData = HomeData();

  final RxString name = ''.obs;
  final RxString username = ''.obs;
  final RxString description = ''.obs;
  final RxString time = ''.obs;
  final RxString profilePhoto = ''.obs;

  RxList<PostModel> postList = RxList([]);

  void getList() async {
    postList.value = await homeData.getList();
  }

  void tweet() {}
}
