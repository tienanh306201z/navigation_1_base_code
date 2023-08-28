import 'package:flutter/material.dart';
import 'package:navigation_1_base_code/navigation/app_route.dart';
import 'package:navigation_1_base_code/navigation/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => AppRouter.pushNamed(AppRoute.home),
              child: const Text("Home"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
