import 'package:filos/bloc.dart';
import 'package:filos/home_page.dart';
import 'package:filos/smile_page.dart';
import 'package:filos/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Bloc>(
      builder: (_) => Bloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: FilosStyles.textTheme,
        ),
        home: LayoutBuilder(
          builder: (context, constraints) {
            print('constraints=$constraints');
            return constraints.maxWidth > 800 ? HomePage() : SmileIncPage();
          },
        ),
      ),
    );
  }
}
