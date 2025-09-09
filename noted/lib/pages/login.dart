import 'package:flutter/material.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCAB5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFCAB5),
      ),
      body: Container(
        margin: const EdgeInsets.all(70),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: "Noted!",
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5D5D5D),
              textAlign: TextAlign.center,
              fontFamily: 'CatPaws',
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 35),
              child: Image.asset(
                'assets/images/cat.jpg',
                width: 240,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: CustomTextField(
                controller: authController.emailController,
                label: "👤 Email",
              ),
            ),
            
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: CustomTextField(
                controller: authController.passwordController,
                label: "🗝️ Password",
                obscure: true,
              ),
            ),
            
            CustomButton(
              myText: "Login",
              onPressed: () {
                authController.login();
              },
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
      ),
    );
  }
}