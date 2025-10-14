import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/pages/form_widgets/newTask_mobile.dart';
import 'package:noted/pages/form_widgets/newTask_wide.dart';



class AddTaskPage extends StatelessWidget {
    AddTaskPage({super.key});
  
    final taskController = Get.find<TodoController>();
  final controller = Get.find<WidgetController>();

@override
Widget build(BuildContext context) {
  final responsiveController = Get.find<WidgetController>();
  responsiveController.updateLayout(context);
  
  return Obx(() => responsiveController.isWideScreen.value 
    ? AddTaskWide() 
    : AddTaskMobile()
  );
}
}