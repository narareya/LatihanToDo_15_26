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

                  return TaskCard(
                    category: category, 
                    tasks: tasks, 
                    onToggle: (index) {
                      taskController.toggleTaskStatus(category, index);
                    });
                },
              );
            }),

            CustomButton(
              myText: "ADD",
              onPressed: () {
                Get.toNamed(
                  AppRoutes.addTaskPage,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
