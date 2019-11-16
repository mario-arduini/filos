import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filos/entity.dart';

final String _kSmileCounter = 'smileCounter';

class Bloc {
  static final _activityCollection = Firestore.instance.collection('activity');
  static final _statisticsSingleton =
      Firestore.instance.collection('statistics').document('singleton');

  Stream<List<Activity>> _activities =
      _activityCollection.snapshots().map((QuerySnapshot snapshot) {
    return snapshot.documents.map((DocumentSnapshot document) {
      return Activity(title: document.data['title']);
    }).toList();
  });

  Stream<List<Activity>> get activities => _activities;

  Stream<List<User>> get users => Stream.value(kFakeUsers);

  Stream<Statistics> get statistics =>
      _statisticsSingleton.snapshots().map((DocumentSnapshot document) {
        return Statistics(smileCount: document.data[_kSmileCounter]);
      });

  void dispose() {}

  void incrementSmile() {
    Firestore.instance.runTransaction((transaction) async {
      final document = await transaction.get(_statisticsSingleton);
      final oldCounter = document.data[_kSmileCounter];
      _statisticsSingleton.updateData({_kSmileCounter: oldCounter + 1});
    });
  }
}
