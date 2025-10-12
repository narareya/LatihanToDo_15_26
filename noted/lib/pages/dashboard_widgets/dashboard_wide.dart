import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/dashboard_controller.dart';

class DashboardWide extends StatelessWidget {
  DashboardWide({super.key});
  
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar (menggantikan bottom navigation)
          Container(
            width: 200,
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 50),
                  child: InkWell(
                    onTap: () => dashboardController.changePage(0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icons/cat-home2.png', height: 35),
                        SizedBox(width: 10),
                        Text('Home', style: TextStyle(
                          fontSize: 18, 
                          color: dashboardController.selectedIndex.value == 0 ? Colors.blue : Colors.black87, 
                          fontWeight: FontWeight.w500
                        )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: InkWell(
                    onTap: () => dashboardController.changePage(1),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icons/cat-history.png', height: 35),
                        SizedBox(width: 10),
                        Text('History', style: TextStyle(
                          fontSize: 18, 
                          color: dashboardController.selectedIndex.value == 1 ? Colors.blue : Colors.black87, 
                          fontWeight: FontWeight.w500
                        )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: InkWell(
                    onTap: () => dashboardController.changePage(2),
                    child: Row(
                      children: [
                        Image.asset('assets/images/icons/cat-user.png', height: 35),
                        SizedBox(width: 10),
                        Text('Profile', style: TextStyle(
                          fontSize: 18, 
                          color: dashboardController.selectedIndex.value == 2 ? Colors.blue : Colors.black87, 
                          fontWeight: FontWeight.w500
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main content area (menggantikan body)
          Expanded(
            child: dashboardController.pages[dashboardController.selectedIndex.value],
          ),
        ],
      ),
    );
  }
}