import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/models/task_model.dart';

class TodoController extends GetxController {
  final taskController = TextEditingController();
  var selectedDate = ''.obs;
  var selectedCategory = ''.obs;
  var selectedPriority = ''.obs;
  
  var tasks = <String, List<TaskModel>>{
    "Work": [],
    "Personal": [],
  }.obs;


  void addTask(String category, TaskModel task) {
    if (tasks.containsKey(category)) {
      tasks[category]!.add(task);
    } else {
      tasks[category] = [task];
    }
    tasks.refresh();
  }

  void toggleTaskStatus(String category, int index) {
    final taskList = tasks[category];
    if (taskList != null && index < taskList.length) {
      taskList[index].isDone = !taskList[index].isDone;
      tasks.refresh();
    }
  }
}