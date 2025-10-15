import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetController extends GetxController{
  var isMobile = true.obs;

  void updateLayout(BoxConstraints constrains) {
    // Ambil ukuran layar
    print("Max width: ${constrains.maxWidth}");
    isMobile.value = constrains.maxWidth < 800;
  }
}