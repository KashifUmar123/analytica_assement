import 'package:analytica_assement/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.child,
    this.navigationBar,
    this.drawer,
    this.statusBarColor,
    this.systemNavigationBarColor,
    this.padding,
    this.floatingActionButton,
  });
  final Widget child;
  final Widget? navigationBar;
  final Widget? drawer;
  final Color? statusBarColor;
  final Color? systemNavigationBarColor;
  final EdgeInsetsGeometry? padding;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? Colors.transparent,
        systemNavigationBarColor:
            systemNavigationBarColor ?? Colors.transparent,
        systemStatusBarContrastEnforced: true,
      ),
      child: Scaffold(
        drawer: drawer,
        body: child,
        backgroundColor: AppColors.background,
        bottomNavigationBar: navigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
