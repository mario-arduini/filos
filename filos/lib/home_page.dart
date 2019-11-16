import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

double _kPadding = 64.0;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        padding: EdgeInsets.symmetric(
          horizontal: _kPadding,
          vertical: _kPadding / 2,
        ),
        crossAxisCount: 6,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Card(
              color: Colors.blue,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text('bb'),
                ),
              ),
            );
          }
          return Card(
            color: Colors.blue,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text('$index'),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: _kPadding,
        crossAxisSpacing: _kPadding,
      ),
    );
  }
}
