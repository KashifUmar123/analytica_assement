import 'package:analytica_assement/features/bottom_navbar/bottom_navbar_controller.dart';
import 'package:get/get.dart';

class BottomNavbarBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomNavbarController>(
      BottomNavbarController(
        navigator: Get.find(),
      ),
    );
  }
}
