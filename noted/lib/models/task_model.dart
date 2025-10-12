class TaskModel {
  int? id;
  String? title;
  String? category;
  String? priority;
  bool? isDone;
  DateTime? dueDate; 

  TaskModel({
    this.id,
    this.title,
    this.category,
    this.priority,
    this.isDone = false,
    this.dueDate, 
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['taskName'],
      category: map['category'],
      priority: map['priority'],
      isDone: map['isDone'] == 1 ? true : false,
      dueDate: map['dueDate'] != null ? DateTime.parse(map['dueDate']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'taskName' : title,
      'category' : category,
      'priority' : priority,
      'isDone' : isDone == true ? 1 : 0,
      'dueDate' : dueDate?.toIso8601String(),
    };
  }
}