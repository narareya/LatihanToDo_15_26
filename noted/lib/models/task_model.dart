class TaskModel {
  String title;
  String priority;
  DateTime? dueDate;
  bool isDone;

  TaskModel({
    required this.title,
    required this.priority,
    this.dueDate,
    this.isDone = false,
  });
}