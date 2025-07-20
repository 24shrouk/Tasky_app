class TaskModel {
  String title;
  String description;
  int periority;
  DateTime dateTime;
  String? id;
  bool isCompeleted;

  TaskModel({
    this.id,
    this.isCompeleted = false,
    required this.title,
    required this.description,
    required this.periority,
    required this.dateTime,
  });
  TaskModel updateIsComplete({bool? isCompleted}) {
    return TaskModel(
      dateTime: dateTime,
      periority: periority,
      id: id,
      title: title,
      description: description,
      isCompeleted: isCompleted ?? isCompeleted,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      isCompeleted: json['isCompeleted'],
      id: json['id'],
      title: json['title'],
      description: json['description'],
      periority: json['periority'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isCompeleted': isCompeleted,
      'id': id,
      'title': title,
      'description': description,
      'periority': periority,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }
}
