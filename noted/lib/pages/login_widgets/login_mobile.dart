import 'package:flutter/material.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_color.dart';


class LoginMobile extends StatelessWidget {
  LoginMobile({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.catCream,
      appBar: AppBar(
        backgroundColor: AppColors.catCream,
      ),
      body: Container(
        margin: const EdgeInsets.all(70),
        alignment: Alignment.center,
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
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 35),
              child: Image.asset(
                'assets/images/logo.png',
                width: 240,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            
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
    );
  }

}
