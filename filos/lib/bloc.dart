import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filos/entity.dart';
import 'package:rxdart/rxdart.dart';

final String _kSmileCounter = 'smileCounter';

User userFromDocument(DocumentSnapshot document) {
  return User(
    name: document.data['name'],
    room: document.data['room'],
    bio: document.data['bio'],
    imageUrl: document.data['imageUrl'],
  );
}

class Bloc {
  Bloc() {
    users.listen(print);
  }
  static final _activityCollection = Firestore.instance.collection('activity');
  static final _userCollection = Firestore.instance.collection('users');
  static final _foodSharingsCollection =
      Firestore.instance.collection('foodSharing');
  static final _statisticsSingleton =
      Firestore.instance.collection('statistics').document('singleton');

  Stream<List<Activity>> _activities =
      _activityCollection.snapshots().map((QuerySnapshot snapshot) {
    return snapshot.documents.map((DocumentSnapshot document) {
      return Activity(title: document.data['title']);
    }).toList(growable: false);
  });

  Stream<List<Activity>> get activities => _activities;

  Stream<List<User>> get users => _userCollection.snapshots().map((snapshot) {
        return snapshot.documents.map((document) {
          return userFromDocument(document);
        }).toList();
      });

  Stream<List<FoodSharing>> get foodSharings =>
      Observable(_foodSharingsCollection.snapshots()).flatMap((snapshot) {
        return Observable.combineLatest(
            snapshot.documents.map((document) async* {
          yield FoodSharing(
            foodName: document.data['foodName'],
            imageUrl: document.data['imageUrl'],
            owner: userFromDocument(
                await (document.data['owner'] as DocumentReference).get()),
          );
        }), (fs) => fs);
      });

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
