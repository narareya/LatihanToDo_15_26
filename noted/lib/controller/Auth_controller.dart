import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final email = emailController.text.toString();
    final password = passwordController.text.toString();
    
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
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", email);
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

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("username");
    Get.offAllNamed(AppRoutes.splashPage);
  }
}