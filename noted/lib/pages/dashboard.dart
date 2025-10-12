import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/controller/dashboard_controller.dart';
import 'package:noted/pages/dashboard_widgets/dashboard_mobile.dart';
import 'package:noted/pages/dashboard_widgets/dashboard_wide.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  
  final dashboardController = Get.find<DashboardController>();
  final controller = Get.find<WidgetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          controller.updateLayout(constraints);
          return Obx(()=> controller.isMobile.value ? DashboardMobile() : DashboardWide() );
        }
        )
    );
  }
}