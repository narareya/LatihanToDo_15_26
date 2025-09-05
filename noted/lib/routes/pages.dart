import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:noted/bindings/auth_binding.dart';
import 'package:noted/pages/login.dart';
import 'package:noted/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => loginPage(), binding: AuthBinding()),
  ];
}