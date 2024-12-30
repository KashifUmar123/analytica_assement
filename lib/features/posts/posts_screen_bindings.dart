import 'package:analytica_assement/core/network/dio_wrapper.dart';
import 'package:analytica_assement/features/posts/posts_screen_controller.dart';
import 'package:analytica_assement/features/posts/services/datasource/i_posts_datasource.dart';
import 'package:analytica_assement/features/posts/services/datasource/posts_remote_datasource_imp.dart';
import 'package:analytica_assement/features/posts/services/repository/i_posts_repository.dart';
import 'package:analytica_assement/features/posts/services/repository/posts_repository_imp.dart';
import 'package:analytica_assement/features/posts/services/usecases/get_posts_usecase.dart';
import 'package:get/get.dart';

class PostsScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPostsDataSource>(
      () => PostsRemoteDatasourceImp(
        dioWrapper: Get.find<IDioWrapper>(),
      ),
    );

    Get.lazyPut<IPostsRepository>(
      () => PostsRepositoryImp(
        datasource: Get.find<IPostsDataSource>(),
      ),
    );

    Get.lazyPut<GetPostsUsecase>(
      () => GetPostsUsecase(
        repository: Get.find<IPostsRepository>(),
      ),
    );

    Get.put(
      PostsScreenController(
        iNavigator: Get.find(),
        getPostsUsecase: Get.find<GetPostsUsecase>(),
      ),
    );
  }
}
