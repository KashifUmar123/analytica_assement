import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  String baseURL = "";
  String geminiAPIKey = "";
  Future<void> init({String filename = "env/.env"}) async {
    await dotenv.load(fileName: filename);
    _populateVariables();
  }

  _populateVariables() {
    baseURL = dotenv.env[_EnvConstants.baseURL] ?? "";
    geminiAPIKey = dotenv.env[_EnvConstants.geminiAPIKey] ?? "";
  }
}

class _EnvConstants {
  static const String baseURL = "BASE_URL";
  static const String geminiAPIKey = "GEMINI_API_KEY";
}
