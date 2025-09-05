import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:noted/bindings/auth_binding.dart';
import 'package:noted/pages/dashboard.dart';
import 'package:noted/pages/history.dart';
import 'package:noted/pages/homepage.dart';
import 'package:noted/pages/login.dart';
import 'package:noted/pages/profile.dart';
import 'package:noted/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage()),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryPage()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.dashboard, page: () => DashboardPage()),
  ];
}