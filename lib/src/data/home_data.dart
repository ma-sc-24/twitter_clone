import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/post_model.dart';

class HomeData {
  final FirebaseFirestore database = FirebaseFirestore.instance;

  Future<List<PostModel>> getList() async {
    List<PostModel> list = [];
    final productInstance = await database.collection('post').get();
    for (var element in productInstance.docs) {
      list.add(PostModel.fromMap(element.data()));
    }

    return list;
  }

  void tweet() {}
}
