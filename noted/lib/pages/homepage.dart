import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/pages/homepage_widgets/homepage_mobile.dart';
import 'package:noted/pages/homepage_widgets/homepage_wide.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});
  final taskController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final widgetController = Get.find<WidgetController>();
    
    return LayoutBuilder(
      builder: (context, constraints) {
        widgetController.updateLayout(context);
        
        return Obx(() => widgetController.isWideScreen.value 
          ? HomepageWide()
          : HomepageMobile()
        );
      },
    );
  }
}