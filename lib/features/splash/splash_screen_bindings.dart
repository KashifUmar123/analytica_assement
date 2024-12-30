import 'package:analytica_assement/features/splash/splash_screen_controller.dart';
import 'package:get/get.dart';

class SplashScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashScreenController>(
      SplashScreenController(
        navigator: Get.find(),
      ),
    );
  }
}
