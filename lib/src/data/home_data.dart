import 'dart:developer';

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

  Future<bool> tweet(PostModel post) async {
    try {
      final createPost = database.collection('post').doc();

      await createPost.set({
        'name': post.name,
        'username': post.username,
        'description': post.description,
        'profilePhoto': post.profilePhoto,
        'time': post.time,
      });

      return true;
    } catch (e) {
      log('$e');
      return false;
    }
  }
}
