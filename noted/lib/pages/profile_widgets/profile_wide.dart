import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/controller/Auth_controller.dart';

class ProfileWide extends StatelessWidget {
  ProfileWide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCAB5),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 30),
                child: const Text(
                  'Meet The Developers!',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.normal,
                    color: Colors.brown,
                    fontFamily: 'CatPaws',
                  ),
                ),
              ),

              // Profile Cards - Horizontal layout for wide screen
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Card 1 - Esta
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildProfileCardWide(
                        name: 'Esta Janitra Lituhayu',
                        absen: '15',
                        phone: '+62 815-7500-7510',
                        github: 'github.com/narareya',
                        imagePath: 'assets/images/Esta.jpeg',
                        backgroundColor: const Color(0xFFF0DAC7),
                        infoBackgroundColor: AppColors.darkBrown,
                        textColor: Colors.white,
                        borderColor: AppColors.darkBrown,
                      ),
                    ),
                  ),
                  
                  // Profile Card 2 - Nandita
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: _buildProfileCardWide(
                        name: 'Nandita Meddina',
                        absen: '26',
                        phone: '+62 811-180-710',
                        github: 'github.com/namdnta',
                        imagePath: 'assets/images/Dita.jpeg',
                        backgroundColor: AppColors.darkBrown,
                        infoBackgroundColor: AppColors.paleBrown,
                        textColor: Colors.black,
                        borderColor: AppColors.paleBrown,
                      ),
                    ),
                  ),
                ],
              ),
            
              // Logout Button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.paleBrown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                              Get.find<AuthController>().logout();
                            },
                            child: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCardWide({
    required String name,
    required String absen,
    required String phone,
    required String github,
    required String imagePath,
    required Color backgroundColor,
    required Color infoBackgroundColor,
    required Color textColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                color: borderColor,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                imagePath,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SizedBox(height: 20),
          
          // Profile Info - Vertical layout for wide cards
          _buildInfoContainer(name, infoBackgroundColor, textColor, 18, FontWeight.bold),
          _buildInfoContainer('Absen: $absen', infoBackgroundColor, textColor, 14, FontWeight.normal),
          _buildInfoContainer(phone, infoBackgroundColor, textColor, 14, FontWeight.normal),
          _buildInfoContainer('Github: $github', infoBackgroundColor, textColor, 14, FontWeight.normal, isLast: true),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String text, Color backgroundColor, Color textColor, double fontSize, FontWeight fontWeight, {bool isLast = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}