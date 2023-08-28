import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text("Login"),
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Back"),
        ),
      ),
    );
  }
}
