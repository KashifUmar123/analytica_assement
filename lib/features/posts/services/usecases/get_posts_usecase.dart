import 'package:analytica_assement/core/base/usecase.dart';
import 'package:analytica_assement/core/network/failures.dart';
import 'package:analytica_assement/features/posts/services/models/get_posts_params.dart';
import 'package:analytica_assement/features/posts/services/models/post_model.dart';
import 'package:analytica_assement/features/posts/services/repository/i_posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostsUsecase extends UseCase<List<PostModel>, GetPostsParams> {
  final IPostsRepository repository;

  GetPostsUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<PostModel>>> call(GetPostsParams params) async {
    return await repository.getPostst(params);
  }
}
