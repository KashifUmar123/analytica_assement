import 'package:analytica_assement/core/base/usecase.dart';
import 'package:analytica_assement/core/network/failures.dart';
import 'package:analytica_assement/core/services/ai_service.dart';
import 'package:dartz/dartz.dart';

class GetAIMessageReponseUsecase extends UseCase<String, String> {
  final AIService _aiService;

  GetAIMessageReponseUsecase({
    required AIService aiService,
  }) : _aiService = aiService;

  @override
  Future<Either<Failure, String>> call(String params) async {
    return await _aiService.getResponse(params);
  }
}
