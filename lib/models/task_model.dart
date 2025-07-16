class TaskModel {
  final String title;
  final String description;
  final int periority;
  final DateTime dateTime;

  TaskModel({
    required this.title,
    required this.description,
    required this.periority,
    required this.dateTime,
  });

  static TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'] as String,
      description: json['description'] as String,
      periority: json['periority'] as int,
      dateTime: json['dateTime'] as DateTime,
    );
  }

  static Map<String, dynamic> toJson(TaskModel task) {
    return {
      'title': task.title,
      'description':task.description,
      'periority':task.periority,
      'dateTime':task.dateTime,
    };
  }
}
