import 'package:analytica_assement/core/network/dio_wrapper.dart';
import 'package:analytica_assement/core/pages/app_navigator.dart';
import 'package:analytica_assement/core/services/ai_service.dart';
import 'package:analytica_assement/core/services/env_service.dart';
import 'package:analytica_assement/core/services/netwrok_service.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<INavigator>(NavigatorImpl(), permanent: true);

    Get.put<INetworkInfo>(NetworkInfoImpl(), permanent: true);

    Get.put<AIService>(GeminiAIService(), permanent: true);

    Get.lazyPut<IDioWrapper>(
      () => DioWrapperImp(
        Dio(
          BaseOptions(
            baseUrl: Get.find<EnvService>().baseURL,
            sendTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 10),
          ),
        ),
      ),
    );
  }
}
