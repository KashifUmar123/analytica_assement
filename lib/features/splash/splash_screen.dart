import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:analytica_assement/core/extensions/context_extension.dart';
import 'package:analytica_assement/core/extensions/num_extension.dart';
import 'package:analytica_assement/core/widgets/custom_scaffold.dart';
import 'package:analytica_assement/features/splash/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Analytica App",
              style: context.label22400,
            ),
            20.verticalSpace,
            const CircularProgressIndicator(
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
