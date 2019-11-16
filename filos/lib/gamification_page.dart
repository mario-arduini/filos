import 'dart:math';

import 'package:flutter/material.dart';

var counts = [5, 3, 16, 12, 7];

class GamificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: listMyWidgets(context),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Center(
                child: Container(
                  color: Colors.black,
                  height: 2.0,
                ),
              ),
              Text(
                'The Smiling House',
                style: Theme.of(context).textTheme.display1,
              )
            ],
          ),
        ],
      ),
    );
  }
}

List<Widget> listMyWidgets(context) {
  List<Widget> list = new List();
  for (var count in counts) {
    list.add(
      new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              count.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
          Center(
            child: getBar(count, context),
          ),
        ],
      ),
    );
  }

  return list;
}

Container getBar(count, context) {
  double _kHeightScale = 0.10;
  if (count == counts.reduce(max)) {
    return new Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 10),
      color: Colors.green,
      width: 48.0,
      height: MediaQuery.of(context).size.height * _kHeightScale,
    );
  } else {
    return new Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 10),
      color: Colors.grey,
      width: 48.0,
      height: MediaQuery.of(context).size.height *
          _kHeightScale *
          count /
          counts.reduce(max),
    );
  }
}
