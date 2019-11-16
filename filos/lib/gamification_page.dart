import 'package:flutter/material.dart';

class GamificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text('3'),
        ),
      ),
    );
  }
}
