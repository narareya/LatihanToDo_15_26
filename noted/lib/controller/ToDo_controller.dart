import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:noted/dbHelper.dart';
import 'package:noted/models/task_model.dart';

class TodoController extends GetxController {
  final taskController = TextEditingController();
  final categoryController = TextEditingController();
  var selectedDate = Rx<DateTime?>(null); // ← Pastikan DateTime
  var selectedCategory = ''.obs;
  var selectedPriority = ''.obs;
  final _dbHelper = DBHelper();
  TaskModel? taskToEdit;
  
  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null && args['task'] != null) {
      taskToEdit = args['task'] as TaskModel;
      taskController.text = taskToEdit!.title ?? '';
      selectedCategory.value = taskToEdit!.category ?? '';
      selectedPriority.value = taskToEdit!.priority ?? '';
      selectedDate.value = taskToEdit!.dueDate;
    }

    fetchTasks();
  }

  // fetch
  Future<void> fetchTasks() async {
    final allTasks = await _dbHelper.getTasks();
    
    // clear data
    tasks.forEach((key, value) => value.clear());
    doneTasks.forEach((key, value) => value.clear());

    // loop
    for (var task in allTasks) {
      final category = task.category ?? "Personal"; // default kalo null
      
      // kalo tasksnya uda slese, masukin ke doneTasks, kalo blom masuk ke tasks
      if (task.isDone == true) {
        doneTasks.putIfAbsent(category, () => <TaskModel>[].obs);
        doneTasks[category]!.add(task);
      }
      else {
        tasks.putIfAbsent(category, () => <TaskModel>[].obs);
        tasks[category]!.add(task);
      }
    }

    tasks.refresh();
    doneTasks.refresh();
  }


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

  Future<void> addTask(String category, TaskModel task) async {
    // Set due date dari selectedDate
    if (selectedDate.value != null) {
      task.dueDate = selectedDate.value;
      print("DEBUG: Task dueDate set to: ${task.dueDate}"); // ← Debug
    } else {
      print("DEBUG: No selectedDate found"); // ← Debug
    }

    // insert database
    final id = await _dbHelper.addTasks(task);
    task.id = id;
    
    // masukin ke map
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

  Future<void> saveTask() async {
    if (taskToEdit == null) {
      final task = TaskModel(
        title: taskController.text,
        category: selectedCategory.value,
        priority: selectedPriority.value,
        dueDate: selectedDate.value,
      );
      await addTask(selectedCategory.value, task);
    }
    else {
      taskToEdit!
      ..title = taskController.text
      ..category = selectedCategory.value
      ..priority = selectedPriority.value
      ..dueDate = selectedDate.value;

      await _dbHelper.updateTasks(taskToEdit!);
      fetchTasks();
    }


    // reset
    taskController.clear();
    selectedPriority.value = '';
    selectedDate.value = null;
    taskToEdit = null;
  }

  Future<void> toggleTaskStatus(String category, int index, {bool fromDone = false}) async {
    final source = fromDone ? doneTasks : tasks;
    final target = fromDone ? tasks : doneTasks;
     // checked unchecked
    final taskList = source[category];

    if (taskList != null && index < taskList.length) {
      final task = taskList[index];
      task.isDone = !(task.isDone ?? false);

      await _dbHelper.updateTasks(task);

      target.putIfAbsent(category, () => <TaskModel>[].obs);
      target[category]!.add(task);
      taskList.removeAt(index);

      tasks.refresh();
      doneTasks.refresh();
    }
  }

  Future<void> deleteTask(String category, int index) async {
    List<TaskModel>? taskList;

    if (tasks[category] != null && index < tasks[category]!.length) {
      taskList = tasks[category];
    }

    else if (doneTasks[category] != null && index < doneTasks[category]!.length) {
      taskList = doneTasks[category];
    }

    if (taskList != null) {
      final task = taskList[index];

      // hapus dari db
      await _dbHelper.deleteTasks(task.id!);

      // hapus dari map
      taskList.removeAt(index);
      tasks.refresh();
      doneTasks.refresh();
    }
  }
}