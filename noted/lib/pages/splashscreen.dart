import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/controller/Splashscreen_controller.dart';
import 'package:noted/components/custom_color.dart';

class SplashscreenPage extends StatelessWidget {
  SplashscreenPage({super.key});
  final splashController = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.lightBeige,
              AppColors.darkBeige,
              AppColors.cream,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon/Logo
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/cat.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30),
              
              // App Name
              Text(
                "Noted",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              
              // Tagline
              Text(
                "Your Personal Todo Manager",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.offWhite,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 40),
              
              // Loading Indicator
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}