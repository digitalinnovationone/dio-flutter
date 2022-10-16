import '../../models/post_model.dart';

abstract class PostsRepository {
  Future<List<PostModel>> getPosts();
}
