import 'package:filos/bloc.dart';
import 'package:filos/entity.dart';
import 'package:filos/face_expression_reader.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmileReadOnlyPage extends StatelessWidget {
  const SmileReadOnlyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Bloc>(
      builder: (_, bloc, __) {
        return StreamBuilder<Statistics>(
          stream: bloc.statistics,
          builder: (context, snapshot) {
            return Card(
              child: snapshot.hasData
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Smile counter',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        Text(
                          '${snapshot.data.smileCount}',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ],
                    )
                  : const Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}

class SmileIncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Bloc>(
      builder: (_, bloc, __) {
        return SmileIncrementor(
          onSmile: () {
            bloc.incrementSmile();
          },
        );
      },
    );
  }
}

class SmileIncrementor extends StatefulWidget {
  SmileIncrementor({Key key, this.onSmile}) : super(key: key);

  final VoidCallback onSmile;
  @override
  _SmileIncrementorState createState() => _SmileIncrementorState();
}

class _SmileIncrementorState extends State<SmileIncrementor> {
  final reader = FaceExpressionReader();
  double smileProb = 0;
  int startTime = 0;
  bool smiling = false;
  bool tookSmile = false;

  @override
  void initState() {
    super.initState();
    reader.addListener(() {
      setState(() {
        final Face currentFace = reader.value;
        smileProb = currentFace?.smilingProbability ?? 0;

        if (smiling) {
          if (smileProb > 0.7) {
            if (!tookSmile &&
                (DateTime.now().millisecondsSinceEpoch - startTime) > 1000) {
              widget.onSmile();
              tookSmile = true;
            }
          } else {
            smiling = false;
          }
        } else {
          if (smileProb > 0.7) {
            smiling = true;
            tookSmile = false;
            startTime = DateTime.now().millisecondsSinceEpoch;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmileReadOnlyPage();
  }
}
