import 'package:analytica_assement/core/services/env_service.dart';
import 'package:get/get.dart';

class Endpoints {
  static String baseUrl = Get.find<EnvService>().baseURL;
  static String posts = '$baseUrl/posts';
}
