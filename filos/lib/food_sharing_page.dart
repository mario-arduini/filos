import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:filos/bloc.dart';
import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const double _kPadding = 64.0;

class FoodSharingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(_kPadding / 4),
            child: Text(
              'Leftovers looking for a new home',
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          Expanded(
            child: Consumer<Bloc>(
              builder: (_, bloc, __) {
                return StreamBuilder<List<FoodSharing>>(
                  stream: bloc.foodSharings,
                  builder: (context, snapshot) {
                    return Container(
                      width: double.infinity,
                      child: snapshot.hasData
                          ? CarouselSlider(
                              items: snapshot.data
                                  .map((fs) => _FoodItem(
                                      foodSharing: fs, onTap: _itemSelected))
                                  .toList(),
                              autoPlay: true,
                              pauseAutoPlayOnTouch: Duration(seconds: 4),
                              viewportFraction: 0.25,
                            )
                          : const Center(child: CircularProgressIndicator()),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _itemSelected(BuildContext context, FoodSharing foodSharing) =>
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(child: TestDialog(foodSharing: foodSharing)),
          );
        },
      );
}

class _FoodItemPopUp extends StatelessWidget {
  final FoodSharing foodSharing;

  const _FoodItemPopUp({
    Key key,
    this.foodSharing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodImageSize = 100.0;
    final userImageSize = 80.0;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            UrlImage(
              url: foodSharing.imageUrl,
              height: foodImageSize,
              width: foodImageSize,
            ),
            Column(
              children: <Widget>[
                Text(
                  foodSharing.owner.name,
                  style: Theme.of(context).textTheme.body2,
                ),
                Text(
                  foodSharing.owner.room,
                  style: Theme.of(context).textTheme.body2,
                ),
                Text(
                  foodSharing.owner.bio,
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
            UrlImage(
              url: foodSharing.owner.imageUrl,
              height: userImageSize,
              width: userImageSize,
            ),
          ],
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text('On my way'),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("Let's cook together"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

class TestDialog extends StatelessWidget {
  final FoodSharing foodSharing;

  const TestDialog({
    Key key,
    this.foodSharing,
  }) : super(key: key);

  final double kWidth = 900;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 400,
          width: kWidth,
          child: Stack(
            children: <Widget>[
              UrlImage(url: foodSharing.imageUrl),
              Container(
                padding: EdgeInsets.all(5.0),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black12,
                      Colors.black45
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Chip(
                            avatar: Icon(Icons.share),
                            label: Text("I can take it"),
                            backgroundColor: Colors.blue[400],
                          ),
                          Padding(padding: EdgeInsets.all(4.0)),
                          Chip(
                            avatar: Icon(Icons.group_add),
                            label: Text("Let's cook together"),
                            backgroundColor: Colors.blue[400],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          UrlImage(
                            url: foodSharing.owner.imageUrl,
                            width: 60,
                            isCircular: true,
                          ),
                          Padding(padding: EdgeInsets.all(8.0)),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                foodSharing.owner.name,
                                style:
                                    Theme.of(context).textTheme.body1.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                              ),
                              Text(
                                foodSharing.owner.room,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              foodSharing.owner.bio,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FoodItem extends StatelessWidget {
  final FoodSharing foodSharing;
  final double width;
  final double height;

  final void Function(BuildContext, FoodSharing) onTap;

  const _FoodItem({
    @required this.foodSharing,
    this.width = double.infinity,
    this.height = 240.0,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatCard(
      child: Material(
        child: InkWell(
          onTap: () {
            if (onTap != null) onTap(context, foodSharing);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(foodSharing.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    foodSharing.foodName,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProfileAvatar(
                      foodSharing.owner.imageUrl,
                      radius: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          foodSharing.owner.name,
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          foodSharing.owner.room,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlatCard extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const FlatCard({
    Key key,
    this.child,
    this.borderColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: child,
      ),
    );
  }
}

class UrlImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final bool isCircular;

  const UrlImage({
    Key key,
    @required this.url,
    this.height = double.infinity,
    this.width = double.infinity,
    this.isCircular = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCircular
        ? CircularProfileAvatar(url, radius: min(width, height) / 2.0)
        : Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
