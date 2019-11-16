import 'package:filos/entity.dart';
import 'package:flutter/material.dart';
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

  }

  void handleAlpaca(int counter) {
    if(!alpacaEntered){
      final int entrance = 1000;
      Future.delayed(Duration(milliseconds: entrance*2), () {
        _controller.animateTo(40,duration: Duration(milliseconds: entrance));
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
            _controller.value= 41;

            setState(() {
              lastAnimated = counter;
              animating = true;
            });

            _controller.animateTo(45,duration: Duration(milliseconds: 400));

            Future.delayed(Duration(milliseconds: 450),(){
              _controller.repeat(min:41,max:45,period: Duration(milliseconds: 500));
              setState(() {
                animating = false;
              });
            });

          });

        } else {
          _controller.repeat(min:41,max:45,period: Duration(milliseconds: 500));
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
              child: snapshot.hasData
                  ? GifImage(
                controller: _controller,
                image: AssetImage("images/animation.gif"),
              ) : const Center(child: CircularProgressIndicator())
            );
          },
        );
      },
    );
  }
}