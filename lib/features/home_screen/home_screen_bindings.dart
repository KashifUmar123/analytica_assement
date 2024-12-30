import 'package:analytica_assement/core/pages/app_navigator.dart';
import 'package:analytica_assement/core/services/ai_service.dart';
import 'package:analytica_assement/features/home_screen/home_screen_controller.dart';
import 'package:analytica_assement/features/home_screen/services/usecases/get_ai_message_response_usecase.dart';
import 'package:get/get.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetAIMessageReponseUsecase>(
      () => GetAIMessageReponseUsecase(
        aiService: Get.find<AIService>(),
      ),
    );

    Get.put<HomeScreenController>(
      HomeScreenController(
        navigator: Get.find<INavigator>(),
        getAIMessageReponseUsecase: Get.find<GetAIMessageReponseUsecase>(),
      ),
    );
  }
}
