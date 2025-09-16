import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_card.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/controller/ToDo_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TodoController>();
    
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.lightBeige,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkBrown.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  CustomText(
                    text: "📜 Task History",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomText(
                      text: "Your completed tasks",
                      fontSize: 16,
                      color: Colors.black54,
                      textAlign: TextAlign.center, 
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            // Completed Tasks Section
            Obx(() {
              final nonEmptyDoneCategories = taskController.doneTasks.entries
                  .where((entry) => entry.value.isNotEmpty)
                  .toList();

              // Empty State
              if (nonEmptyDoneCategories.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.mediumBrown.withOpacity(0.2),
                      width: 1,
                    ),
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
                          text: "No completed tasks yet",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black, 
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomText(
                          text: "Complete some tasks to see them here!",
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

              // Completed Tasks List
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: nonEmptyDoneCategories.length,
                itemBuilder: (context, index) {
                  final category = nonEmptyDoneCategories[index].key;
                  final tasks = nonEmptyDoneCategories[index].value;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightBeige.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TaskCard(
                      category: category, 
                      tasks: tasks, 
                      onToggle: (taskIndex) {
                        taskController.toggleTaskStatus(category, taskIndex, fromDone: true);
                      },
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}