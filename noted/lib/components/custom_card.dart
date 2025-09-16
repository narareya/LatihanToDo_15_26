import 'package:flutter/material.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/models/task_model.dart';

class TaskCard extends StatelessWidget {
  final String category;
  final List<TaskModel> tasks;
  final Function(int) onToggle;

  const TaskCard({super.key, required this.category, required this.tasks, required this.onToggle});

  @override
  Widget build(BuildContext context) {
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 12
              ),
              decoration: BoxDecoration(
                color: AppColors.lightBeige,
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

            const SizedBox(height: 8,),

            Column(
              children: tasks.asMap().entries.map((entry) {
                final taskIndex = entry.key;
                final task = entry.value;

                return ListTile(
                  leading: Checkbox(
                    value: task.isDone, 
                    onChanged: (value) => onToggle(taskIndex),
                  ),
                  title: Text(task.title,
                  style: TextStyle(
                    decoration: task.isDone ? 
                    TextDecoration.lineThrough : null,
                    color: task.isDone ? Colors.black : Colors.black,
                  ),),
                  subtitle: Text(task.priority),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                );
              }).toList(),
            )
          ],
        ),
        ),
    );
  }
}