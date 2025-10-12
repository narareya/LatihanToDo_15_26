import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/pages/login_widgets/login_mobile.dart';
import 'package:noted/pages/login_widgets/login_wide.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widgetController = Get.find<WidgetController>();
    
    return LayoutBuilder(
      builder: (context, constraints) {
        widgetController.updateLayout(context);
        
        return Obx(() => widgetController.isWideScreen.value 
          ? LoginWide() 
          : LoginMobile()
        );
      },
    );
  }
}