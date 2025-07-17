import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky_app/models/user_model.dart';

abstract class FireBaseDatabase {
  static CollectionReference collectionUser() {
    return FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }
}
