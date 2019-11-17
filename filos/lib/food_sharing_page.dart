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
                                  .map((fs) => _FoodItem(foodSharing: fs))
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
}

class _FoodItem extends StatelessWidget {
  final FoodSharing foodSharing;
  final double width;
  final double height;

  final void Function(FoodSharing) onTap;

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
            if (onTap != null) onTap(foodSharing);
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
