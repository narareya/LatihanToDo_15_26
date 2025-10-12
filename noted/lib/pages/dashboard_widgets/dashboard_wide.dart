import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/dashboard_controller.dart';

class DashboardWide extends StatelessWidget {
  DashboardWide({super.key});
  
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: dashboardController.selectedIndex.value,
            onDestinationSelected: dashboardController.changePage,
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(icon: Image.asset('assets/images/icons/cat-home2.png', height: 35,), label: Text('Home'),),
              NavigationRailDestination(icon: Image.asset('assets/images/icons/cat-history.png', height: 35,), label: Text('History'),),
              NavigationRailDestination(icon: Image.asset('assets/images/icons/cat-user.png', height: 35,), label: Text('Profile'),),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1,),
          Expanded(
            child: dashboardController.pages[dashboardController.selectedIndex.value],
          ),
        ],
      ),
    ));
  } // Hapus kurung kurawal ekstra yang ada di sini
}