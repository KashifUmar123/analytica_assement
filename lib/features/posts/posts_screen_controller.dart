import 'package:analytica_assement/core/base/base_controller.dart';
import 'package:analytica_assement/core/pages/app_navigator.dart';
import 'package:analytica_assement/core/utils/app_utils.dart';
import 'package:analytica_assement/features/posts/services/models/get_posts_params.dart';
import 'package:analytica_assement/features/posts/services/models/post_model.dart';
import 'package:analytica_assement/features/posts/services/usecases/get_posts_usecase.dart';
import 'package:flutter/material.dart';

class PostsScreenController extends BaseController {
  final GetPostsUsecase _getPostsUsecase;
  PostsScreenController(
      {required INavigator iNavigator,
      required GetPostsUsecase getPostsUsecase})
      : _getPostsUsecase = getPostsUsecase,
        super(navigator: iNavigator);

  // control variables
  bool isLoading = false;
  bool hasMoreItems = true;
  String? error;
  bool isPaginating = false;
  bool hasPaginationRegistered = false;

  // data variables
  late ScrollController scrollController;
  GetPostsParams params = GetPostsParams(
    page: 1,
    limit: 20,
  );
  List<PostModel> posts = [];

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    _loadPosts();
  }

  bool get canPaginate {
    if (!isPaginating && error == null && hasMoreItems && !isLoading) {
      return true;
    }
    return false;
  }

  void registerPagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 150) {
        if (canPaginate) {
          _loadPosts(showLoading: false, paginate: true);
        }
        debugPrint("PAGE END DETECTED");
      }
    });
  }

  Future<void> onRefresh() async {
    await _loadPosts(showLoading: false);
  }

  Future<void> onRetry() async {
    await _loadPosts();
  }

  Future<void> _loadPosts({showLoading = true, paginate = false}) async {
    isLoading = showLoading;
    error = null;
    if (paginate) {
      isPaginating = true;
    }
    update();

    // make params
    if (paginate) {
      params = params.copyWith(page: params.page + 1);
    } else {
      // means pull down to refresh
      params = params.copyWith(page: 1);
    }

    debugPrint("_loadPosts");

    final result = await _getPostsUsecase.call(params);
    result.fold(
      (left) {
        debugPrint("[POSTS FETCHING FALIED]: ${left.message}");
        if (paginate || !showLoading) {
          AppUtils.showCustomSnackbar(
            title: "Error",
            message: left.message,
            isError: true,
          );
        } else {
          hasPaginationRegistered = false;
          error = left.message;
        }
      },
      (right) {
        debugPrint("[POSTS FETCHED]: ${right.length}");
        if (params.page == 1) {
          posts = right;
        } else {
          posts.addAll(right);
        }

        if (right.length < params.limit) {
          hasMoreItems = false;
        } else {
          hasMoreItems = true;
        }
      },
    );

    isLoading = false;
    isPaginating = false;
    if (!hasPaginationRegistered) {
      registerPagination();
    }
    update();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
