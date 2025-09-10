import 'package:get/get.dart';
import 'package:noted/controller/ToDo_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }

}