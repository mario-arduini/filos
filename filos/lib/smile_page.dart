import 'package:filos/face_expression_reader.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

class SmilePage extends StatefulWidget {
  SmilePage({Key key}) : super(key: key);

  @override
  _SmilePageState createState() => _SmilePageState();
}

class _SmilePageState extends State<SmilePage> {
  final FaceExpressionReader reader = FaceExpressionReader();
  int _counter = 0;
  double smileProb = 0;

  @override
  void initState() {
    super.initState();
    reader.addListener(() {
      print("Getting called");
      print(reader.toString());
      setState(() {
        final Face currentFace = reader.value;
        smileProb = currentFace?.smilingProbability ?? 0;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
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
            ),
            Text(
              smileProb.toString(),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
