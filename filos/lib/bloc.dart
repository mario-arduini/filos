import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filos/entity.dart';

class Bloc {
  static final _activityCollection = Firestore.instance.collection('activity');

  Stream<List<Activity>> _activities =
      _activityCollection.snapshots().map((QuerySnapshot snapshot) {
    return snapshot.documents.map((DocumentSnapshot document) {
      return Activity(title: document.data['title']);
    }).toList();
  });

  Stream<List<Activity>> get activities => _activities;

  Stream<List<User>> get users => Stream.value(kFakeUsers);

  void dispose() {}
}
