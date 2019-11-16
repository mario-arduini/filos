import 'package:meta/meta.dart';

const String _kUserPhotoUrl =
    'https://images.emojiterra.com/google/android-pie/512px/1f913.png';

const List<User> kFakeUsers = [
  User(
    name: 'Tinka',
    room: 'Room 301',
    bio: 'This is the first user',
    imageUrl: _kUserPhotoUrl,
  ),
  User(
    name: 'Mario',
    room: 'Room 301',
    bio: 'This is the first user',
    imageUrl: _kUserPhotoUrl,
  ),
  User(
    name: 'Bella',
    room: 'Room 301',
    bio: 'This is the first user',
    imageUrl: _kUserPhotoUrl,
  ),
  User(
    name: 'David',
    room: 'Room 301',
    bio: 'This is the first user',
    imageUrl: _kUserPhotoUrl,
  ),
  User(
    name: 'Edman',
    room: 'Room 301',
    bio: 'This is the first user',
    imageUrl: _kUserPhotoUrl,
  ),
];

class User {
  final String name;
  final String bio;
  final String imageUrl;
  final String room;

  const User({
    @required this.room,
    @required this.name,
    @required this.bio,
    @required this.imageUrl,
  });
}

class Activity {
  final String title;

  const Activity({this.title});
}

class Recipe {
  final String title;

  const Recipe({@required this.title});
}
