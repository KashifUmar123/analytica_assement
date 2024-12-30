import 'package:analytica_assement/features/posts/posts_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends GetView<PostsScreenController> {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return SizedBox(
          height: Get.height * .87,
          width: double.infinity,
        );
      },
    );
  }
}
