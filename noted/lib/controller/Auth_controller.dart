import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text;
    final password = passwordController.text;

    if (email == 'admin' && password == '123') {
      Get.snackbar('Success', 'Login Successful');

    } else {
      Get.snackbar('Error', 'Invalid email or password');
    }
  }
}