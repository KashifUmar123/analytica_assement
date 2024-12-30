import 'package:analytica_assement/core/pages/route_names.dart';
import 'package:analytica_assement/features/bottom_navbar/bottom_navbar.dart';
import 'package:analytica_assement/features/bottom_navbar/bottom_navbar_bindings.dart';
import 'package:analytica_assement/features/home_screen/home_screen_bindings.dart';
import 'package:analytica_assement/features/posts/posts_screen_bindings.dart';
import 'package:analytica_assement/features/splash/splash_screen.dart';
import 'package:analytica_assement/features/splash/splash_screen_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initialRoute = RouteNames.splash;
  static List<GetPage> pages = [
    // common
    getPage(
      name: RouteNames.splash,
      page: const SplashScreen(),
      binding: SplashScreenBindings(),
    ),
    getPage(
      name: RouteNames.bottomNav,
      page: const CustomBottomNavbar(),
      bindings: [
        BottomNavbarBindings(),
        HomeScreenBindings(),
        PostsScreenBindings(),
      ],
    ),
  ];

  static GetPage getPage({
    required String name,
    required Widget page,
    Bindings? binding,
    List<Bindings>? bindings,
    dynamic arguments,
    Transition transition = Transition.fadeIn,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return GetPage(
      name: name,
      page: () => page,
      binding: binding,
      bindings: bindings ?? [],
      transition: transition,
      transitionDuration: transitionDuration,
    );
  }
}
