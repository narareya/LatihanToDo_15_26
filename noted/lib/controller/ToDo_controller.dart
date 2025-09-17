import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/models/task_model.dart';

  class TodoController extends GetxController {
    final taskController = TextEditingController();
    final categoryController = TextEditingController();
    var selectedDate = ''.obs;
    var selectedCategory = ''.obs;
    var selectedPriority = ''.obs;

    var tasks = <String, List<TaskModel>>{ // default category
      "Work": [],
      "Personal": [],
    }.obs;

    var doneTasks = <String, List<TaskModel>>{ // done tasks
      "Work": [],
      "Personal": [],
    }.obs;

    void addTask(String category, TaskModel task) { // nambah task
      if (tasks.containsKey(category)) {
        tasks[category]!.add(task);
      } else {
        tasks[category] = [task];
      }
      tasks.refresh();
    }

    void addCategory(String category) { // nambah category
      if (!tasks.containsKey(category) && category.isNotEmpty) {
        tasks[category] = [];
        selectedCategory.value = category;
        tasks.refresh();
      }
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
        task.isDone = !task.isDone;

        target.putIfAbsent(category, () => []);
        target[category]!.add(task);
        taskList.removeAt(index);

        tasks.refresh();
        doneTasks.refresh();
      }
    }

    
}