import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  final String name;

  const SettingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Text("Setting"),
              ],
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: ElevatedButton(onPressed: () {}, child: Text(name)),
        ),
      ),
    );
  }
}
