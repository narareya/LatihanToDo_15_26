import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final splashController = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ini splashscreen"),
          ],
        ),
      ),
    );
  }
}