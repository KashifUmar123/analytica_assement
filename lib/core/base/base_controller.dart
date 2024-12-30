import 'package:analytica_assement/core/pages/app_navigator.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  final INavigator navigator;

  BaseController({
    required this.navigator,
  });
}
