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
              child: Column(
                children: [
                  const CustomText(
                    text: "👋 Welcome, Narareya!",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CustomText(
                      text: "Let's get productive! 🚀",
                      fontSize: 16,
                      color: Colors.black54,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            // Task Cards - USE CUSTOM CARD
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
                  child: const Column(
                    children: [
                      Icon(Icons.task_alt, size: 48, color: Colors.black54),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: CustomText(
                          text: "No tasks yet",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black, 
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
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

              // Task List - SIMPLE dengan CustomCard
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index].key;
                  final tasks = categories[index].value;
                  
                  // USE CUSTOM CARD - SIMPLE!
                  return TaskCard(
                    category: category,
                    tasks: tasks,
                    onToggle: (taskIndex) {
                      taskController.toggleTaskStatus(category, taskIndex);
                    },
                    onLongPress: (taskIndex) {
                      showModalBottomSheet(
                        context: context, 
                        builder: (_) {
                          final task = tasks[taskIndex];
                          return Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text('Edit Task'),
                                  onTap: () {
                                    Get.toNamed(AppRoutes.addTaskPage, arguments: {'task' : task});
                                  },
                                ),
                                ListTile(
                                  title: const Text('Delete Task'),
                                  onTap: () async {
                                    Navigator.pop(context);

                                    final result = await showDialog<bool>(context: context, builder: (context) => AlertDialog(
                                      title: const Text('Delete Task?'),
                                      content: Text('Are you sure you want to delete this task?'),
                                      actions: [
                                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
                                        TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
                                      ],
                                    ),);

                                    if (result == true) {
                                      taskController.deleteTask(category, taskIndex);
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                    },
                  );
                },
              );
            }),

            // Extra space for floating button
            const SizedBox(height: 80),
          ],
        ),
      ),
      
      // Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(AppRoutes.addTaskPage);
        },
        backgroundColor: AppColors.mediumBrown,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text(
          "ADD TASK",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}