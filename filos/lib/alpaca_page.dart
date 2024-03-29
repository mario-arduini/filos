import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';



class AlpacaPage extends StatefulWidget {

  @override
  _AlpacaPageState createState() => new _AlpacaPageState();

}

class _AlpacaPageState extends State<AlpacaPage> with SingleTickerProviderStateMixin{

  GifController _controller;
  int lastAnimated = 0;
  bool alpacaEntered = false;
  bool animating = false;
  
  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
    _controller.value = 0;
    animating = false;

  }

  void handleAlpaca(int counter) {
    if(!alpacaEntered){
      final int entrance = 1000;
      Future.delayed(Duration(milliseconds: entrance*2), () {
        _controller.animateTo(39,duration: Duration(milliseconds: entrance));
        Future.delayed(Duration(milliseconds: entrance),(){
          setState(() {
            alpacaEntered = true;
          });
        });
      });

    } else {
      if(!animating){
        if(lastAnimated<counter){

          Future.delayed(Duration(milliseconds: 20), () {
            _controller.value= 45;

            setState(() {
              lastAnimated = counter;
              animating = true;
            });

            _controller.animateTo(68,duration: Duration(milliseconds: 2000));

            Future.delayed(Duration(milliseconds: 2050),(){
              _controller.repeat(min:39,max:44,period: Duration(milliseconds: 500));
              setState(() {
                animating = false;
              });
            });

          });

        } else {
          //_controller.repeat(min:41,max:45,period: Duration(milliseconds: 500));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Consumer<Bloc>(
      builder: (_,bloc,__){
        return StreamBuilder<Statistics>(
          stream: bloc.statistics,
          builder: (context,snapshot){
            if(snapshot.hasData)
              handleAlpaca(snapshot.data.smileCount);

            return Card(
              color: Color.fromARGB(255, 167, 219, 215),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(

                    child: snapshot.hasData ?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: animating ? <Widget>[
                          Flexible(
                            child: Text("Such a beautiful smile ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40
                              ),),
                          ),
                          Icon(
                            Icons.mood,
                            size: 50,
                            color: Colors.white,
                          )
                        ]
                        : <Widget>[
                          Flexible(
                            child: Text("Have a lovely day, gorgeous ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40
                              ),),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.pinkAccent,
                            size: 50,
                          )
                        ],
                      ) : Text("Getting counter"),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(

                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: snapshot.hasData
                            ? Column(
                              children: <Widget>[
                                Text(snapshot.data.smileCount.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold
                                  ),),
                                Text("smiles", textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 40
                                  ),)
                            ],
                            )
                            : Text("Getting smiles", textAlign: TextAlign.center,),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: snapshot.hasData
                            ? GifImage(
                          controller: _controller,
                          image: AssetImage("images/animation3.gif"),
                        ) : const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ],
              )
            );
          },
        );
      },
    );
  }
}