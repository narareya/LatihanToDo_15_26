import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:noted/controller/dashboard_controller.dart';

class DashboardMobile extends StatelessWidget {
  DashboardMobile({super.key});
  
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: dashboardController.pages[dashboardController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: dashboardController.selectedIndex.value,
        onTap: dashboardController.changePage,
        items: [
          BottomNavigationBarItem(icon: Image.asset('assets/images/icons/cat-home2.png', height: 35,), label: 'Home',),
          BottomNavigationBarItem(icon: Image.asset('assets/images/icons/cat-history.png', height: 35,), label: 'History',),
          BottomNavigationBarItem(icon: Image.asset('assets/images/icons/cat-user.png', height: 35,), label: 'Profile',),
        ],
      ),
    ));
  }
}