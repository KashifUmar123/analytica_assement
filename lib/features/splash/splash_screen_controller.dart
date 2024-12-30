import 'package:analytica_assement/core/base/base_controller.dart';
import 'package:analytica_assement/core/pages/route_names.dart';

class SplashScreenController extends BaseController {
  SplashScreenController({required super.navigator});

  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    navigator.pushReplacementNamed(RouteNames.bottomNav, analyticKey: "");
  }
}
