import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/custom_text.dart'; 
import 'package:noted/components/todo_card.dart';
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
            const CustomText(
              text: "Welcome Narareya!",
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),

            // Category list
            Obx(() {
              // filter category
              final nonEmptyCategories = taskController.tasks.entries
                  .where((entry) => entry.value.isNotEmpty)
                  .toList();

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: nonEmptyCategories.length,
                itemBuilder: (context, index) {
                  final category = nonEmptyCategories[index].key;
                  final tasks = nonEmptyCategories[index].value;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Category
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // List Task
                          Column(
                            children: tasks.asMap().entries.map((entry) {
                              final taskIndex = entry.key;
                              final task = entry.value;

                              return ListTile(
                                leading: Checkbox(
                                  value: task.isDone,
                                  onChanged: (value) {
                                    taskController.toggleTaskStatus(
                                        category, taskIndex);
                                  },
                                ),
                                title: Text(
                                  task.title,
                                  style: TextStyle(
                                    decoration: task.isDone
                                        ? TextDecoration.lineThrough
                                        : null,
                                    color: task.isDone
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                subtitle: Text(task.priority),
                                dense: true,
                                contentPadding: EdgeInsets.zero,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),

            CustomButton(
              myText: "ADD",
              onPressed: () {
                Get.toNamed(
                  AppRoutes.addTaskPage,
                  arguments: taskController.tasks.keys.toList(), // ngepassing category
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
