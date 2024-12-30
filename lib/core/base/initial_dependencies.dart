import 'package:analytica_assement/core/services/env_service.dart';
import 'package:analytica_assement/core/services/storage_service.dart';
import 'package:analytica_assement/core/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';

class InitialDependencies {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // INIT TRANSLATIONS
    await AppTranslations.loadTranslations();

    // INIT ENV SERVICE
    Get.lazyPut<EnvService>(() => EnvService());
    await Get.find<EnvService>().init();

    // INIT ENV SERVICE
    Get.lazyPut<StorageService>(() => StorageService());
    await Get.find<StorageService>().loadData();

    Gemini.init(apiKey: Get.find<EnvService>().geminiAPIKey);
  }
}
