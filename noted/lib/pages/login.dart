import 'package:flutter/material.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cat.jpg',
              width: 240,
              height: 240,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 70),
            CustomTextField(
              controller: authController.emailController,
              label: "👤 Email",
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: authController.passwordController,
              label: "🗝️ Password",
              obscure: true,
            ),
            const SizedBox(height: 20),
            // Simple Button
            CustomButton(
              myText: "Login",
              onPressed: () {
                authController.login();
              },
            )
          ],
        ),
      ),
    );
  }
}