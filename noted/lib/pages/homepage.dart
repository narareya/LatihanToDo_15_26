import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Added for Obx
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/custom_text.dart'; // Assuming taskController is defined in this file
import 'package:noted/components/todo_card.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/routes/routes.dart'; // Assuming TodoCard is defined in this file

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TodoController>(); // Ensure taskController is defined

    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Obx(() => Column(
                    children: taskController.tasks.entries.map((entry) {
                      final category = entry.key;
                      final tasks = entry.value;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7), // Updated to use withOpacity
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Task list
                            Column(
                              children: List.generate(tasks.length, (index) {
                                final task = tasks[index];
                                return TodoCard(
                                  title: task.title,
                                  isDone: task.isDone,
                                  onToggle: () =>
                                      taskController.toggleTaskStatus(category, index),
                                );
                              }),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )),

                  CustomButton(myText: "ADD", onPressed: () {
                    Get.toNamed(
                      AppRoutes.addTaskPage,
                      arguments: taskController.tasks.keys.toList(), // Pass categories as arguments
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}