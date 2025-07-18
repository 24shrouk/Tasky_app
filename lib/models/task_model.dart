class TaskModel {
  final String title;
  final String description;
  final int periority;
  final DateTime dateTime;
  final String? id;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.periority,
    required this.dateTime,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      periority: json['periority'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'periority': periority,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }
}
