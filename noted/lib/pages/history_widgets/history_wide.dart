import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_card.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/routes/routes.dart';

class HistoryWide extends StatelessWidget {
  const HistoryWide({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TodoController>();
    
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: Row(
          children: [
            // Left Panel - Header & Stats
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Header Section
                    Container(
                      padding: const EdgeInsets.all(24),
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
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: CustomText(
                              text: "Your completed tasks",
                              fontSize: 18,
                              color: Colors.black54,
                              textAlign: TextAlign.center, 
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 24),
                    
                    // Stats Section
                    Obx(() {
                      final totalCompleted = taskController.doneTasks.values
                          .fold<int>(0, (sum, tasks) => sum + tasks.length);
                      
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.mediumBrown.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.mediumBrown.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.emoji_events,
                              size: 48,
                              color: Colors.amber,
                            ),
                            SizedBox(height: 12),
                            CustomText(
                              text: "$totalCompleted",
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                              textAlign: TextAlign.center,
                            ),
                            CustomText(
                              text: "Tasks Completed",
                              fontSize: 16,
                              color: Colors.black54,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.normal,
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            
            // Right Panel - Completed Tasks Grid
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Completed Tasks",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      textAlign: TextAlign.left,
                    ),
                    
                    SizedBox(height: 16),
                    
                    Expanded(
                      child: Obx(() {
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/sad-cat.png',
                                  width: 120,
                                  height: 120,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: CustomText(
                                    text: "No completed tasks yet",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black, 
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomText(
                                    text: "Complete some tasks to see them here!",
                                    fontSize: 16,
                                    color: Colors.black54,
                                    textAlign: TextAlign.center, 
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        // Completed Tasks Grid for wide screen
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 columns for wide screen
                            childAspectRatio: 1.1,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemCount: nonEmptyDoneCategories.length,
                          itemBuilder: (context, index) {
                            final category = nonEmptyDoneCategories[index].key;
                            final tasks = nonEmptyDoneCategories[index].value;

                            return TaskCard(
                              category: category, 
                              tasks: tasks, 
                              onToggle: (taskIndex) {
                                taskController.toggleTaskStatus(category, taskIndex, fromDone: true);
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
                                            title: const Text('Delete Task'),
                                            onTap: () async {
                                              Navigator.pop(context);

                                              final result = await showDialog<bool>(
                                                context: context, 
                                                builder: (context) => AlertDialog(
                                                  title: const Text('Delete Task?'),
                                                  content: Text('Are you sure you want to delete this task?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context, false), 
                                                      child: const Text('No')
                                                    ),
                                                    TextButton(
                                                      onPressed: () => Navigator.pop(context, true), 
                                                      child: const Text('Yes')
                                                    ),
                                                  ],
                                                ),
                                              );

                                              if (result == true) {
                                                taskController.deleteTask(category, taskIndex);
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                );
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