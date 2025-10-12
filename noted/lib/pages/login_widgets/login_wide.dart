import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/components/custom_color.dart';

class LoginWide extends StatelessWidget {
  LoginWide({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.catCream,
      body: Row(
        children: [
          // Left side - Image
          Expanded(
            flex: 1,
            child: Container(
              color: AppColors.catCream,
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Image.asset(
                    'assets/images/cat.jpg',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // Right side - Login form
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Noted!",
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontFamily: 'CatPaws',
                  ),
                  
                  SizedBox(height: 40),
                  
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      controller: authController.emailController,
                      label: "Username",
                    ),
                  ),
                  
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: CustomTextField(
                      controller: authController.passwordController,
                      label: "Password",
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
          ),
        ],
      ),
    );
  }
}