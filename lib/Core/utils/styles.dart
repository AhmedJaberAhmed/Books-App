import 'package:flutter/material.dart';

abstract class Styles {
  static const titleMeaduim =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  static const TimesNewRoman = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.white,
    fontFamily: 'Times New Roman',
    shadows: [
      Shadow(
        offset: Offset(1.0, 1.0),
        blurRadius: 3.0,
        color: Colors.white,
      ),
    ],
  );
  static const textStyle14 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  static const textStyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static const textStyle20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.normal);
}
