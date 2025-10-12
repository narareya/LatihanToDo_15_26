import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetController extends GetxController{
  var isWideScreen = false.obs;

  void updateLayout(BuildContext context) {
    // Ambil ukuran layar
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Set breakpoint (misalnya 600px)
    isWideScreen.value = screenWidth > 600;
      
  }
}