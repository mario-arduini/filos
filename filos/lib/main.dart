import 'package:filos/bloc.dart';
import 'package:filos/entity.dart';
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
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Bloc>(
          builder: (_, bloc, __) {
            return StreamBuilder<List<Activity>>(
              stream: bloc.activities,
              builder: (context, snapshot) {
                print('$snapshot');
                return ListView(
                  children: [
                    Text('hello yow'),
                    if (!snapshot.hasData)
                      const Center(child: CircularProgressIndicator()),
                    if (snapshot.hasData)
                      for (final a in snapshot.data) Text(a.title),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
