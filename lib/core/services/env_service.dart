import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  String baseURL = "";
  Future<void> init({String filename = "env/.env"}) async {
    await dotenv.load(fileName: filename);
    _populateVariables();
  }

  _populateVariables() {
    baseURL = dotenv.env[EnvConstants.baseURL] ?? "";
  }
}

class EnvConstants {
  static const String baseURL = "BASE_URL";
}
