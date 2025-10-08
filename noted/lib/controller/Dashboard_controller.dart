import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Auth_controller.dart';
import 'package:noted/pages/history.dart';
import 'package:noted/pages/homepage.dart';
import 'package:noted/pages/profile.dart';

class DashboardController extends GetxController{

  final authController = Get.put(AuthController(), permanent: true); 

  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void changePage(int index){
    selectedIndex.value = index;
  }
}