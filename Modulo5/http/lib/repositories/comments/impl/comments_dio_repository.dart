import 'package:dio/dio.dart';
import 'package:trilhaapp/model/comment_model.dart';
import 'package:trilhaapp/repositories/comments/comments_repository.dart';

import '../../jsonplaceholder_custon_dio.dart';

class CommentsDioRepsositoy implements CommentsRepository {
  @override
  Future<List<CommentModel>> retornaComentarios(int postId) async {
    var jsonPlaceHolderCustonDio = JsonPlaceHolderCustonDio();
    var response =
        await jsonPlaceHolderCustonDio.dio.get("/posts/$postId/comments");
    return (response.data as List)
        .map((e) => CommentModel.fromJson(e))
        .toList();
  }
}
