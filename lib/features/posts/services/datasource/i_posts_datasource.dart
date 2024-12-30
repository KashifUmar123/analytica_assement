import 'package:analytica_assement/features/posts/services/models/get_posts_params.dart';
import 'package:analytica_assement/features/posts/services/models/post_model.dart';

abstract class IPostsDataSource {
  Future<List<PostModel>> getPosts(GetPostsParams params);
}
