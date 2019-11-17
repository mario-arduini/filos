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
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: 400,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(
                                'https://www.ayy.fi/sites/g/files/flghsv231/files/styles/2_3_1380w_600h_n/public/2019-11/yhdistyskoulutuskuva_1_0.png?h=9550b3ad&itok=UDg0h0u1'),
                          ),
                        ),
                      ),
                      Text(
                        'Association Event',
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 220,
                      width: 400,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                              'https://www.aalto.fi/sites/g/files/flghsv161/files/styles/o_914w_ah_n/public/2019-11/aalto_sci_olli_ikkala_photo_by_lasse_lecklin_01.jpg?itok=GQWOaEHG'),
                        ),
                      ),
                    ),
                    Text(
                        'Humbolt Prize awarded to Olli Ikkala',
                        textAlign: TextAlign.start,
                      ),
                  ],
                ),
              ),
            ),
          ]
        )
    );
  }
}
