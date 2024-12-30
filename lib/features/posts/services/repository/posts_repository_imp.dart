import 'package:analytica_assement/core/network/failures.dart';
import 'package:analytica_assement/features/posts/services/datasource/i_posts_datasource.dart';
import 'package:analytica_assement/features/posts/services/models/get_posts_params.dart';
import 'package:analytica_assement/features/posts/services/models/post_model.dart';
import 'package:analytica_assement/features/posts/services/repository/i_posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImp extends IPostsRepository {
  final IPostsDataSource datasource;

  PostsRepositoryImp({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<PostModel>>> getPostst(
    GetPostsParams params,
  ) async {
    try {
      final response = await datasource.getPosts(params);
      return Right(response);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(ServerFailure("Something wen't wrong"));
    }
  }
}
