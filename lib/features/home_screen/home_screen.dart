import 'dart:developer';
import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:analytica_assement/core/extensions/context_extension.dart';
import 'package:analytica_assement/core/extensions/num_extension.dart';
import 'package:analytica_assement/core/widgets/custom_animated_switcher.dart';
import 'package:analytica_assement/core/widgets/custom_textfield.dart';
import 'package:analytica_assement/features/home_screen/home_screen_controller.dart';
import 'package:analytica_assement/features/home_screen/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return SizedBox(
          height: Get.height * .87,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                context.topSafeArea.verticalSpace,
                Expanded(
                  child: CustomAnimatedSwitcher(
                    child: _buildView(context),
                  ),
                ),
                _buildBottombar(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildView(BuildContext context) {
    if (controller.messages.isEmpty) {
      return Center(
        child: Text(
          "Initiate a chat with Gemini",
          style: context.label22400,
        ),
      );
    } else {
      return ListView.separated(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        reverse: true,
        itemBuilder: (context, index) {
          return MessageTile(
            message: controller.messages[index],
          );
        },
        separatorBuilder: (context, index) {
          return 10.verticalSpace;
        },
        itemCount: controller.messages.length,
      );
    }
  }

  Row _buildBottombar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width * .75,
          child: CustomTextfield(
            controller: controller.messageController,
            hinText: "Search",
          ),
        ),
        InkWell(
          onTap: () {
            log("tapped");
            controller.addMessage();
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue,
            ),
            child: Center(
              child: CustomAnimatedSwitcher(
                child: controller.isMessageFetching
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      )
                    : const Icon(
                        Icons.chevron_right,
                        color: AppColors.white,
                        size: 40,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
