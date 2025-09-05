import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/routes/routes.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  void login() {
    final user = username.text;
    final pass = password.text;

    if (user == 'admin' && pass == '123') {
      Get.snackbar('Success', 'Login Successful');
      Get.offNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }
}