import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:analytica_assement/core/extensions/context_extension.dart';
import 'package:analytica_assement/core/widgets/custom_animated_switcher.dart';
import 'package:analytica_assement/core/widgets/custom_button.dart';
import 'package:analytica_assement/features/posts/posts_screen_controller.dart';
import 'package:analytica_assement/features/posts/widgets/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends GetView<PostsScreenController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return SizedBox(
          height: Get.height * .87,
          width: double.infinity,
          child: Column(
            children: [
              _buildAppbar(context),
              Expanded(
                child: CustomAnimatedSwitcher(
                  child: _buildView(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildView() {
    if (controller.isLoading) {
      return const CircularProgressIndicator();
    } else if (controller.error != null) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                controller.error.toString(),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                  text: "Retry",
                  callback: () {
                    controller.onRetry();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: controller.onRefresh,
      child: ListView.separated(
        controller: controller.scrollController,
        padding: const EdgeInsets.only(top: 15),
        itemBuilder: (context, index) {
          if (index == controller.posts.length) {
            if (controller.isPaginating) {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 30,
                ),
                child: CircularProgressIndicator(
                  color: AppColors.blue,
                ),
              ));
            } else {
              return const SizedBox(height: 30);
            }
          }
          return PostWidget(post: controller.posts[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemCount: controller.posts.length + 1,
      ),
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Text(
            "Posts",
            style: context.label22400.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
