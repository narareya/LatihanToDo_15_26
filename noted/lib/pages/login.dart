import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/controller/Auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),

      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: authController.username, label: "Username"),
            CustomTextField(controller: authController.password, label: "Password", obscure: true,),
            SizedBox(height: 20,),
            CustomButton(myText: "Login", onPressed: () {
              authController.login();
            })
          ],
        ),
      )
    );
  }
}