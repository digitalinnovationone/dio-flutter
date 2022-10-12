import 'dart:convert';

import '../../../models/post_model.dart';
import '../jsonplaceholder_custon_dio.dart';
import '../posts_repository.dart';

class PostsDioRepository implements PostsRepository {
  final JsonPlaceHolderCustonDio jsonPlaceHolderCustonDio;
  PostsDioRepository(this.jsonPlaceHolderCustonDio);
  @override
  Future<List<PostModel>> getPosts() async {
    var response = await jsonPlaceHolderCustonDio.dio.get("/posts");
    if (response.statusCode == 200) {
      return (response.data as List).map((e) => PostModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
