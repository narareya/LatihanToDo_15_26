import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:noted/pages/profile_widgets/profile_mobile.dart';
import 'package:noted/pages/profile_widgets/profile_wide.dart';


class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final widgetController = Get.find<WidgetController>();
    
    return LayoutBuilder(
      builder: (context, constraints) {
        widgetController.updateLayout(context);
        
        return Obx(() => widgetController.isWideScreen.value 
          ? ProfileWide() 
          : ProfileMobile()
        );
      },
    );
  }
  }
  
