
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:noted/bindings/auth_binding.dart';
import 'package:noted/bindings/dashboard_binding.dart';
import 'package:noted/bindings/home_binding.dart';
import 'package:noted/bindings/splashscreen_binding.dart';
import 'package:noted/pages/login.dart';
import 'package:noted/pages/dashboard.dart';
import 'package:noted/pages/history.dart';
import 'package:noted/pages/homepage.dart';
import 'package:noted/pages/newTask.dart';
import 'package:noted/pages/profile.dart';
import 'package:noted/pages/splashscreen.dart';
import 'package:noted/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryPage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.dashboard, page: () => DashboardPage(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.addTaskPage, page: () => AddTaskPage(), binding: HomeBinding()),
    GetPage(name: AppRoutes.splashPage, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
  ];
}