import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_card.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/custom_text.dart'; 
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/routes/routes.dart';

class HomepageWide extends StatelessWidget {
  const HomepageWide({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: Row(
          children: [
            // Left side - Welcome & Stats
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Header
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: AppColors.lightBeige,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          const CustomText(
                            text: "👋 Welcome, Narareya!",
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: CustomText(
                              text: "Let's get productive! 🚀",
                              fontSize: 18,
                              color: Colors.black54,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Add Task Button
                    Container(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Get.toNamed(AppRoutes.addTaskPage);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mediumBrown,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.add, size: 24),
                        label: const Text(
                          "ADD TASK",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Right side - Task List
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Your Tasks",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      textAlign: TextAlign.left,
                    ),
                    
                    SizedBox(height: 16),
                    
                    Expanded(
                      child: Obx(() {
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
                              mainAxisAlignment: MainAxisAlignment.center,
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

                        // Task List in Grid for wide screen
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns for wide screen
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index].key;
                            final tasks = categories[index].value;
                            
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}