class TaskModel {
  String? title;
  String? priority;
  bool? isDone;
  DateTime? dueDate; // ← Pastikan field ini ada

  TaskModel({
    this.title,
    this.priority,
    this.isDone = false,
    this.dueDate, // ← Dan di constructor
  });
}