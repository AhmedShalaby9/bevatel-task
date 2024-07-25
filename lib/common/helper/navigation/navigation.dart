import '../../../my_app.dart';

class Navigation {
  static Navigation? singleton;

  factory Navigation() {
    singleton = singleton ?? Navigation._internal();
    return singleton!;
  }

  Navigation._internal();

  Future<dynamic> navigateTo({required String routeName, Object? arg}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  Future<dynamic> navigateAndReplacement(
      {required String routeName, Object? arg}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arg);
  }

  navigateAndPopUntil({required bool beCleared}) {
    return navigatorKey.currentState!.popUntil((_) => beCleared);
  }

  Future<dynamic> navigateAndRemoveUntil(
      {required String routeName, bool beCleared = false, Object? arg}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (_) => beCleared, arguments: arg);
  }

  goBack({dynamic argument}) {
    return navigatorKey.currentState!.pop(argument);
  }

  goBackByNumberOfSteps({dynamic argument, required int steps}) {
    int count = 0;
    return navigatorKey.currentState!.popUntil((_) => count++ >= steps);
  }
}
