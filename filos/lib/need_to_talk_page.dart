import 'package:flutter/material.dart';

class NeedToTalkPage extends StatelessWidget {
  const NeedToTalkPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Stack(
      children: <Widget>[
        Center(
          child: Icon(
            Icons.favorite,
            color: Colors.pinkAccent,
            semanticLabel: "Heart Icon",
            size: 250.0,
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: Text(
              'Need to\ntalk',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ))
      ],
    ));
  }
}
