import 'package:get/get.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/controller/Widget_controller.dart';
import 'package:noted/controller/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<TodoController>(()=>TodoController());
    Get.lazyPut<WidgetController>(()=>WidgetController());
  }
} 