import 'package:flutter/material.dart';
import 'package:navigation_1_base_code/navigation/app_route.dart';
import 'package:navigation_1_base_code/navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation 1 Base Code',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoute.splash.path,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: AppRouter.navigationKey,
      navigatorObservers: [AppRouter.navigatorObserver],
    );
  }
}
