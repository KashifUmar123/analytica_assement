import 'package:analytica_assement/core/base/base_controller.dart';
import 'package:analytica_assement/features/home_screen/home_screen.dart';
import 'package:flutter/widgets.dart';

class BottomNavbarController extends BaseController {
  BottomNavbarController({required super.navigator});

  int selectedIndex = 0;

  void onIndexChanged(int index) {
    selectedIndex = index;
    update();
  }

  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
}
