import 'package:get/get.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:noted/controller/Widget_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<WidgetController>(()=>WidgetController());
  }
}