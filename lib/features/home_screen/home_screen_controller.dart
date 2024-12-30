import 'package:analytica_assement/core/base/base_controller.dart';
import 'package:analytica_assement/features/home_screen/services/models/message_model.dart';
import 'package:analytica_assement/features/home_screen/services/usecases/get_ai_message_response_usecase.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends BaseController {
  final GetAIMessageReponseUsecase _getAIMessageReponseUsecase;
  HomeScreenController({
    required super.navigator,
    required GetAIMessageReponseUsecase getAIMessageReponseUsecase,
  }) : _getAIMessageReponseUsecase = getAIMessageReponseUsecase;

  // controllers
  late TextEditingController messageController;

  @override
  onInit() {
    super.onInit();
    messageController = TextEditingController();
  }

  // data holders
  List<MessageModel> messages = [];
  bool isMessageFetching = false;

  Future<void> _getResponse(String message) async {
    isMessageFetching = true;
    update();
    final response = await _getAIMessageReponseUsecase(message);
    response.fold(
      (failure) {
        messages.insert(
          0,
          MessageModel(
            message: failure.message,
            isUser: false,
            isFailed: true,
          ),
        );
      },
      (response) {
        messages.insert(
          0,
          MessageModel(
            message: response,
            isUser: false,
          ),
        );
      },
    );
    isMessageFetching = false;
    update();
  }

  void addMessage() {
    final message = messageController.text;
    if (isMessageFetching) return;
    if (messageController.text.isEmpty) {
      return;
    }
    messages.insert(
      0,
      MessageModel(
        message: message,
        isUser: true,
      ),
    );
    messageController.clear();
    update();
    _getResponse(message);
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
