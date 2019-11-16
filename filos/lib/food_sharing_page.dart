import 'package:filos/entity.dart';
import 'package:flutter/material.dart';

const double _kPadding = 64.0;

class FoodSharingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Food sharing
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(_kPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Food sharing',
              style: Theme.of(context).textTheme.display1,
            ),
            Row(
              children: <Widget>[
                _FoodItem(
                  user: kFakeUsers[0],
                  title: 'Carrot',
                  coverUrl:
                      'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/09/2048x1364/gallery-1519672422-carrots.jpg?resize=480:*',
                ),
                _FoodItem(
                  user: kFakeUsers[1],
                  title: 'Carrot',
                  coverUrl:
                      'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/09/2048x1364/gallery-1519672422-carrots.jpg?resize=480:*',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodItem extends StatelessWidget {
  final String title;
  final String coverUrl;
  final double width;
  final double height;
  final User user;

  const _FoodItem({
    Key key,
    @required this.title,
    @required this.coverUrl,
    @required this.user,
    this.width = 180.0,
    this.height = 180.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.body1,
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(coverUrl),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
