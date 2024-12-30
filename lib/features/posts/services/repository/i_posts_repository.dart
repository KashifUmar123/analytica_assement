import 'package:analytica_assement/core/network/failures.dart';
import 'package:analytica_assement/features/posts/services/models/get_posts_params.dart';
import 'package:analytica_assement/features/posts/services/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class IPostsRepository {
  Future<Either<Failure, List<PostModel>>> getPostst(GetPostsParams params);
}
