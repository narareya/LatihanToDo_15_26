import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:noted/components/custom_card.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/controller/ToDo_controller.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.find<TodoController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        elevation: 0,
      ),
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Obx(() {
              final nonEmptyDoneCategories = taskController.doneTasks.entries
                .where((entry) => entry.value.isNotEmpty)
                .toList();

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: nonEmptyDoneCategories.length,
                itemBuilder: (context, index) {
                  final category = nonEmptyDoneCategories[index].key;
                  final tasks = nonEmptyDoneCategories[index].value;

                  return TaskCard(
                    category: category, 
                    tasks: tasks, 
                    onToggle: (index) {
                      taskController.toggleTaskStatus(category, index, fromDone: true);
                    });
                });
            }
            )
          ],
        ))
    );
  }
}