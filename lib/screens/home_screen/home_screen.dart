import 'package:flutter/material.dart';
import 'package:navigation_1_base_code/navigation/app_route.dart';
import 'package:navigation_1_base_code/navigation/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text("Home"),
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AppRouter.pushNamed(AppRoute.setting, arguments: {"name": "Alva Tran"}),
          child: const Text("Settings"),
        ),
      ),
    );
  }
}
