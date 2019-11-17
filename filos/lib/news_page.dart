import 'package:filos/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 300,
                  width: 800,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://www.ayy.fi/sites/g/files/flghsv231/files/styles/2_3_1380w_600h_n/public/2019-11/yhdistyskoulutuskuva_1_0.png?h=9550b3ad&itok=UDg0h0u1'),
                    ),
                  ),
                ),
                Text(
                  'Food sharing',
                  style: Theme.of(context).textTheme.display1,
                ),
            ]),
            Container(
              child: Text(
                'Food sharing',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ]
        )
    );
  }
}
