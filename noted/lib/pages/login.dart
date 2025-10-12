import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/pages/login_widgets/login_mobile.dart';
import 'package:noted/pages/login_widgets/login_wide.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final authController = Get.find<AuthController>();
  final controller = Get.find<WidgetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          controller.updateLayout(constraints);
          return Obx(()=> controller.isMobile.value ? LoginMobile() : LoginWide() );
        }
        )
    );
  }
}