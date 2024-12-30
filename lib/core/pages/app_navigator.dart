import 'dart:async';
import 'package:get/get.dart';

abstract class INavigator {
  Future<T?>? pushNamed<T>(
    String route, {
    required String analyticKey,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  });

  void pop<T>({T? result});

  void popUntil(
    String route, {
    required String analyticKey,
  });

  void pushReplacementNamed(
    String route, {
    required String analyticKey,
    dynamic arguments,
    Map<String, String>? parameters,
  });

  void offAndPushNamed(
    String route, {
    required String analyticKey,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  });

  void analyticEventLog({
    required String analyticKey,
    Map<String, dynamic>? params,
  });
}

class NavigatorImpl extends INavigator {
  @override
  void pop<T>({T? result}) {
    Get.back<T>(result: result);
  }

  @override
  void popUntil(
    String route, {
    required String analyticKey,
  }) {
    analyticEventLog(analyticKey: analyticKey);
    Get.until(
      (data) => data.settings.name == route,
    );
  }

  @override
  Future<T?>? pushNamed<T>(
    String route, {
    required String analyticKey,
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    analyticEventLog(
      analyticKey: analyticKey,
      params: parameters,
    );

    return await Get.toNamed<T>(
      route,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
    );
  }

  @override
  void offAndPushNamed(
    String route, {
    required String analyticKey,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) {
    analyticEventLog(
      analyticKey: analyticKey,
      params: parameters,
    );
    Get.offNamed(
      route,
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }

  @override
  void pushReplacementNamed(
    String route, {
    required String analyticKey,
    dynamic arguments,
    Map<String, String>? parameters,
  }) {
    analyticEventLog(
      analyticKey: analyticKey,
      params: parameters,
    );
    Get.offAllNamed(route, arguments: arguments);
  }

  @override
  void analyticEventLog({
    required String analyticKey,
    Map<String, dynamic>? params,
  }) {
    // TODO: log event
  }
}
