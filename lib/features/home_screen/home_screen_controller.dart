import 'package:analytica_assement/core/base/base_controller.dart';
import 'package:analytica_assement/features/home_screen/services/usecases/get_ai_message_response_usecase.dart';

class HomeScreenController extends BaseController {
  final GetAIMessageReponseUsecase _getAIMessageReponseUsecase;
  HomeScreenController({
    required super.navigator,
    required GetAIMessageReponseUsecase getAIMessageReponseUsecase,
  }) : _getAIMessageReponseUsecase = getAIMessageReponseUsecase;

  @override
  onInit() {
    super.onInit();
    getResponse("Hello Gemini");
  }

  Future<void> getResponse(String message) async {
    final response = await _getAIMessageReponseUsecase(message);
    response.fold(
      (failure) => print("Error: $failure"),
      (response) => print("Response: $response"),
    );
  }
}
