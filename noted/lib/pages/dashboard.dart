import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:noted/controller/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  
  DashboardController dashboardController = DashboardController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: dashboardController.pages[dashboardController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: dashboardController.selectedIndex.value,
        onTap: dashboardController.changePage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History',),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',),
        ],
      ),
    ));
  }
}