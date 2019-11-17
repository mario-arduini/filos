import 'package:flutter/material.dart';

abstract class FilosStyles {
  static const display1 = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w700,
    fontSize: 40.0,
  );

  static const body1 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 24.0,
  );

  static const body2 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 26.0,
  );

  static const caption = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 22.0,
  );

  static const textTheme = TextTheme(
    display1: display1,
    body1: body1,
    body2: body2,
    caption: caption,
  );
}
