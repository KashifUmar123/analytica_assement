import 'package:analytica_assement/core/network/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

abstract class AIService {
  Future<Either<Failure, String>> getResponse(String message);
}

class GeminiAIService implements AIService {
  @override
  Future<Either<Failure, String>> getResponse(String message) async {
    try {
      final response = await Gemini.instance.prompt(parts: [
        Part.text(message),
      ]);
      return Right(response?.output ?? '');
    } catch (e) {
      debugPrint("Gemini Error: $e");
      return Left(CustomFailure("Gemini Error: $e"));
    }
  }
}
