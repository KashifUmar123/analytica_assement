import 'package:analytica_assement/core/constants/endpoints.dart';
import 'package:analytica_assement/core/network/dio_wrapper.dart';
import 'package:analytica_assement/core/network/failures.dart';
import 'package:analytica_assement/features/posts/services/datasource/i_posts_datasource.dart';
import 'package:analytica_assement/features/posts/services/models/get_posts_params.dart';
import 'package:analytica_assement/features/posts/services/models/post_model.dart';

class PostsRemoteDatasourceImp implements IPostsDataSource {
  final IDioWrapper _dioWrapper;

  PostsRemoteDatasourceImp({
    required IDioWrapper dioWrapper,
  }) : _dioWrapper = dioWrapper;

  @override
  Future<List<PostModel>> getPosts(GetPostsParams params) async {
    final response = await _dioWrapper.onGet(
      api: Endpoints.posts,
      queryParameters: params.toMap(),
    );
    if (response.data != null) {
      return (response.data as List).map((e) {
        return PostModel.fromJson(e);
      }).toList();
    }

    throw DioDefaultFailure(message: "Something wen't wrong");
  }
}
