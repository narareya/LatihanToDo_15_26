import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/routes/routes.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    final email = emailController.text;
    final password = passwordController.text;
    
    print("Email: $email");
    print("Password: $password");
    
    // Simple validation
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error", 
        "Please fill all fields",
        snackPosition: SnackPosition.TOP,
      );
      return;
    }
    
    // login
    if (email == "Narareya" && password == "nmdnta") {
      Get.snackbar(
        "Success", 
        "Login successful!",
        snackPosition: SnackPosition.TOP,
      );
      Get.offAllNamed(AppRoutes.dashboard);
    } else {
      Get.snackbar(
        "Error", 
        "Invalid credentials",
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}