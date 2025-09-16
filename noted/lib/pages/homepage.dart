import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_card.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/custom_text.dart'; 
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            
            // Welcome Header
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.lightBeige,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                children: [
                  CustomText(
                    text: "Welcome, Narareya!",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomText(
                      text: "Let's get productive!",
                      fontSize: 16,
                      color: Colors.black54,
                      textAlign: TextAlign.center, fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            // Task Cards
            Obx(() {
              final categories = taskController.tasks.entries
                  .where((entry) => entry.value.isNotEmpty)
                  .toList();

              // Empty State
              if (categories.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/sad-cat.png',
                        width: 100,
                        height: 100,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: CustomText(
                          text: "No tasks yet",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black, textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomText(
                          text: "Add your first task to get started!",
                          fontSize: 14,
                          color: Colors.black54,
                          textAlign: TextAlign.center, 
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                );
              }

              // Task List
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index].key;
                  final tasks = categories[index].value;
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: TaskCard(
                      category: category, 
                      tasks: tasks, 
                      onToggle: (taskIndex) {
                        taskController.toggleTaskStatus(category, taskIndex);
                      },
                    ),
                  );
                },
              );
            }),

            // Add Button - Using CustomButton
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomButton(
                myText: "ADD TASK",
                onPressed: () {
                  Get.toNamed(AppRoutes.addTaskPage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}