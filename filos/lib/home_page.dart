import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const double _kPadding = 64.0;

class HomePage extends StatelessWidget {
  final colors = [
    Colors.blue,
    Colors.amber,
    Colors.brown,
    Colors.green,
    Colors.deepPurple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        padding: EdgeInsets.symmetric(
          horizontal: _kPadding,
          vertical: _kPadding / 2,
        ),
        crossAxisCount: 6,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          // Smile counter
          if (index == 1) {
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Smile counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Text(
                    '14',
                    style: Theme.of(context).textTheme.display1,
                  )
                ],
              ),
            );
          }
          // Alpaca
          if (index == 5) {
            return Card(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images-na.ssl-images-amazon.com/images/I/51YX0Mm05CL._SX425_.jpg'),
                  ),
                ),
                child: Align(
                  alignment: Alignment(0.8, -0.85),
                  child: Text(
                    'Have a lovely day!',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
            );
          }
          // Food sharing
          if (index == 4) {
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
                        Card(
                          child: Column(
                            children: <Widget>[
                              Text('Carrot'),
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/09/2048x1364/gallery-1519672422-carrots.jpg?resize=480:*'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Text('Carrot'),
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/09/2048x1364/gallery-1519672422-carrots.jpg?resize=480:*'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Text('Carrot'),
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/09/2048x1364/gallery-1519672422-carrots.jpg?resize=480:*'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Card(
                          child: Column(
                            children: <Widget>[
                              Text('Carrot'),
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/09/2048x1364/gallery-1519672422-carrots.jpg?resize=480:*'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Card(
            color: colors[index],
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('$index'),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) {
          if (index == 4) return StaggeredTile.count(4, 2);
          if (index == 5) return StaggeredTile.count(2, 2);
          return StaggeredTile.count(2, index.isEven ? 2 : 1);
        },
        mainAxisSpacing: _kPadding,
        crossAxisSpacing: _kPadding,
      ),
    );
  }
}
