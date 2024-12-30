import 'package:analytica_assement/features/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeScreenController>(
      HomeScreenController(
        navigator: Get.find(),
      ),
    );
  }
}
