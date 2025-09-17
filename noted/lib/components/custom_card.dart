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

            const SizedBox(height: 8),

            Column(
              children: tasks.asMap().entries.map((entry) {
                final taskIndex = entry.key;
                final task = entry.value;
                final isCompleted = task.isDone ?? false;

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.grey.shade100 : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isCompleted ? Colors.blue.shade300 : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      // Checkbox
                      GestureDetector(
                        onTap: () => onToggle(taskIndex),
                        child: Icon(
                          isCompleted 
                              ? Icons.check_box 
                              : Icons.check_box_outline_blank,
                          color: isCompleted 
                              ? Colors.blue 
                              : Colors.grey,
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Task Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Task Title
                            Text(
                              task.title ?? "No Title",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                decoration: isCompleted 
                                    ? TextDecoration.lineThrough 
                                    : null,
                                color: isCompleted 
                                    ? Colors.grey.shade600 
                                    : Colors.black87,
                              ),
                            ),

                            // Task Priority
                            if (task.priority != null && task.priority!.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  "Priority: ${task.priority}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: isCompleted 
                                        ? Colors.grey.shade500 
                                        : Colors.black54,
                                  ),
                                ),
                              ),

                            // Due Date with Debug
                            if (task.dueDate != null)
Padding(
  padding: const EdgeInsets.only(top: 2),
  child: Text(
    task.dueDate != null 
        ? "Due date: ${_formatDate(task.dueDate!)}"
        : "Debug: dueDate is null - ${task.dueDate}",
    style: TextStyle(
      fontSize: 14,
      color: task.dueDate != null 
          ? (isCompleted ? Colors.grey.shade500 : Colors.black54)
          : Colors.red,
      fontWeight: task.dueDate != null ? FontWeight.normal : FontWeight.bold,
    ),
  ),
)
                            else
                              // Debug - show if no date
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  "No due date set", // Debug text
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red, // Red untuk debug
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for date formatting
  String _formatDate(DateTime date) {
    final months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    
    return "${date.day} ${months[date.month]} ${date.year}";
  }
}