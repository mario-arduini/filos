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
  int startedSmiling = 0;
  bool smiling = false;
  bool tookSmile = false;

  @override
  void initState() {
    super.initState();
    reader.addListener(() {
      print("Getting called");
      print(reader.toString());
      setState(() {
        final Face currentFace = reader.value;
        smileProb = currentFace?.smilingProbability ?? 0;

        if(smiling){
          if(smileProb > 0.7){
            if(!tookSmile && (new DateTime.now().millisecondsSinceEpoch - startedSmiling)>1000) {
              _counter++;
              tookSmile = true;
            }
          } else {
            smiling = false;
          }
        } else {
          if(smileProb > 0.7){
            smiling = true;
            tookSmile = false;
            startedSmiling = new DateTime.now().millisecondsSinceEpoch;
          }
        }
      });
    });
  }

  void _incrementCounter() {
    setState(() {
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
                    _counter.toString(),
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
