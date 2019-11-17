import 'package:filos/main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class GetInvolvedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Get Involved',
              textAlign: TextAlign.start,
            ),
            Container(
              height: 170,
              width: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      'https://cdn.discordapp.com/attachments/644945527909384217/645514192589160458/alpaca_qr.png'),
                ),
              ),
            ),
          ]
        )
    );
  }
}
