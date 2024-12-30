import 'package:analytica_assement/core/base/initial_bindings.dart';
import 'package:analytica_assement/core/base/initial_dependencies.dart';
import 'package:analytica_assement/core/pages/app_pages.dart';
import 'package:analytica_assement/core/pages/route_names.dart';
import 'package:analytica_assement/core/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await InitialDependencies.init();
  runApp(const AnalyticaApp());
}

class AnalyticaApp extends StatelessWidget {
  const AnalyticaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: InitialBindings(),
      translations: AppTranslations(),
      locale: AppTranslations.locales.first,
      initialRoute: RouteNames.splash,
      getPages: AppRoutes.pages,
    );
  }
}
