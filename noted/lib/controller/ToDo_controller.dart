import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/models/task_model.dart';

class TodoController extends GetxController {
  final taskController = TextEditingController();
  final categoryController = TextEditingController();
  var selectedDate = Rx<DateTime?>(null); // ← Pastikan DateTime
  var selectedCategory = ''.obs;
  var selectedPriority = ''.obs;

  void addCategory(String category) {
    if (!tasks.containsKey(category)) {
      tasks[category] = <TaskModel>[].obs;
    }
    selectedCategory.value = category;
    update();
  }

  var tasks = <String, List<TaskModel>>{
    "Work": [],
    "Personal": [],
  }.obs;

  var doneTasks = <String, List<TaskModel>>{
    "Work": [],
    "Personal": [],
  }.obs;

  // Method untuk set due date
  void setDueDate(DateTime? date) {
    selectedDate.value = date;
    print("DEBUG: Selected date set to: $date"); // ← Debug
  }

  void addTask(String category, TaskModel task) {
    // Set due date dari selectedDate
    if (selectedDate.value != null) {
      task.dueDate = selectedDate.value;
      print("DEBUG: Task dueDate set to: ${task.dueDate}"); // ← Debug
    } else {
      print("DEBUG: No selectedDate found"); // ← Debug
    }
    
    if (tasks.containsKey(category)) {
      tasks[category]!.add(task);
    } else {
      tasks[category] = [task];
    }
    tasks.refresh();
    
    // Reset setelah add
    selectedDate.value = null;
  }



  void selectCategory(String category) { // pilih category
    if (tasks.containsKey(category)) {
      selectedCategory.value = category;
    }
  }

  void toggleTaskStatus(String category, int index, {bool fromDone = false}) {
    final source = fromDone ? doneTasks : tasks;
    final target = fromDone ? tasks : doneTasks;
     // checked unchecked
    final taskList = source[category];

    if (taskList != null && index < taskList.length) {
      final task = taskList[index];
      task.isDone = !(task.isDone ?? false);

      target.putIfAbsent(category, () => []);
      target[category]!.add(task);
      taskList.removeAt(index);

      tasks.refresh();
      doneTasks.refresh();
    }
  }
}