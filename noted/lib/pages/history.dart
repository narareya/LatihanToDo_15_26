import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/pages/history_widgets/history_mobile.dart';
import 'package:noted/pages/history_widgets/history_wide.dart';


class HistoryPage extends StatelessWidget {
    HistoryPage({super.key});
  
    final taskController = Get.find<TodoController>();
    final controller = Get.find<WidgetController>();

@override
Widget build(BuildContext context) {
  final responsiveController = Get.find<WidgetController>();
  
  return Obx(() => responsiveController.isMobile.value 
    ? HistoryMobile() 
    : HistoryWide()
  );
}
}