import 'package:meta/meta.dart';

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

  @override
  String toString() {
    return 'User{name: $name, bio: $bio, imageUrl: $imageUrl, room: $room}';
  }
}

class FoodSharing {
  final User owner;
  final String foodName;
  final String imageUrl;

  const FoodSharing({
    @required this.owner,
    @required this.foodName,
    @required this.imageUrl,
  });

  @override
  String toString() {
    return 'FoodSharing{owner: $owner, foodName: $foodName}';
  }
}

class WantToInteract {
  final User user;
  final bool available;

  WantToInteract({
    @required this.user,
    @required this.available,
  });

  @override
  String toString() {
    return 'WantToInteract{user: $user, available: $available}';
  }
}

class Activity {
  final String title;

  const Activity({@required this.title});
}

class Recipe {
  final String title;

  const Recipe({@required this.title});
}

class Statistics {
  final int smileCount;

  Statistics({this.smileCount});

  @override
  String toString() {
    return 'Statistics{smileCount: $smileCount}';
  }
}
