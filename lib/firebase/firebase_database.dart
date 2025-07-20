import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky_app/models/task_model.dart';
import 'package:tasky_app/models/user_model.dart';

abstract class FireBaseDatabase {
  static CollectionReference<UserModel> collectionUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }

  static Future<void> createUser(UserModel user) async {
    return collectionUser().doc(user.id).set(user);
  }

  static Future<UserModel?> getUser(String id) async {
    var data = await collectionUser().doc(id).get();
    return data.data();
  }

  static CollectionReference<TaskModel> collectionTasks() {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    return collectionUser()
        .doc(userId)
        .collection('Tasks')
        .withConverter<TaskModel>(
          fromFirestore: (snapShot, _) => TaskModel.fromJson(snapShot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future<void> createTask({
    required String title,
    required String description,
    required int periority,
    required DateTime dateTime,
    required bool isCompeleted,
  }) async {
    var docref = collectionTasks().doc();
    var taskId = docref.id;
    var task = TaskModel(
      id: taskId,
      title: title,
      description: description,
      periority: periority,
      dateTime: dateTime,
    );
    return docref.set(task);
  }

  static Future<List<TaskModel>> getAllTask() async {
    var dataListOfTask = await collectionTasks().get();
    return dataListOfTask.docs.map((task) => task.data()).toList();
  }

  static Future<void> updateTask(TaskModel task) async {
    return await collectionTasks().doc(task.id).update(task.toJson());
  }

  static Future<void> deleteTask(TaskModel task) {
    return collectionTasks().doc(task.id).delete();
  }

  static Future<TaskModel> getTask(TaskModel task) async {
    var taskModel = await collectionTasks().doc(task.id).get();
    return taskModel.data()!;
  }
}
