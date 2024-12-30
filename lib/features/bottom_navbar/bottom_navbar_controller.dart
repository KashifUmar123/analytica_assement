import 'package:analytica_assement/core/base/base_controller.dart';

class BottomNavbarController extends BaseController {
  BottomNavbarController({required super.navigator});

  int selectedIndex = 0;

  void onIndexChanged(int index) {
    selectedIndex = index;
    update();
  }
}
