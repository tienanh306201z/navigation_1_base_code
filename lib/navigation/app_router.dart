import 'package:flutter/material.dart';
import 'package:navigation_1_base_code/screens/error_screen/error_screen.dart';
import 'package:navigation_1_base_code/screens/login_screen/login_screen.dart';
import 'package:navigation_1_base_code/screens/setting_screen/setting_screen.dart';
import 'package:navigation_1_base_code/screens/splash_screen/splash_screen.dart';

import '../screens/home_screen/home_screen.dart';
import 'app_route.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static final NavigatorObserver _navigatorObserver = NavigatorObserver();

  static NavigatorObserver get navigatorObserver => _navigatorObserver;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};
    final routeName = settings.name as String;
    switch (routeName.appRoute) {
      case AppRoute.home:
        return _getPageRoute(
          routeName: routeName,
          viewToShow: const HomeScreen(),
        );
      case AppRoute.login:
        return _getPageRoute(
          routeName: routeName,
          viewToShow: const LoginScreen(),
        );
      case AppRoute.setting:
        return _getPageRoute(
          routeName: routeName,
          viewToShow: SettingScreen(name: arguments["name"] ?? ""),
        );
      case AppRoute.splash:
        return _getPageRoute(
          routeName: routeName,
          viewToShow: const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => ErrorScreen(errorPath: settings.name ?? ""),
        );
    }
  }

  static PageRoute _getPageRoute({
    required String routeName,
    required Widget viewToShow,
  }) {
    RouteSettings settings = RouteSettings(
      name: routeName,
    );

    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => viewToShow,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static void pop() {
    if (_navigationKey.currentState!.canPop()) {
      _navigationKey.currentState!.pop();
    }
  }

  static Future<bool> maybePop() {
    return _navigationKey.currentState!.maybePop();
  }

  static bool canPop() {
    return _navigationKey.currentState!.canPop();
  }

  static void popUntil(AppRoute routeName) {
    return _navigationKey.currentState!
        .popUntil(ModalRoute.withName(routeName.path));
  }

  static Future<dynamic> pushNamed(AppRoute routeName, {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName.path, arguments: arguments);
  }

  static Future<dynamic> pushReplacementNamed(AppRoute routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName.path, arguments: arguments);
  }

  static Future<dynamic> popAndPushNamed(AppRoute routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState!
        .popAndPushNamed(routeName.path, arguments: arguments);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
      AppRoute routeName, String removeRouteName,
      {dynamic arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
        routeName.path, ModalRoute.withName(removeRouteName));
  }
}
