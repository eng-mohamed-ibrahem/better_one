import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(_hexColorToInt(hexColor));

  static int _hexColorToInt(String color) {
    color = color.contains('#') ? color.replaceAll(RegExp(r'#'), '') : color;
    color.length == 6 ? color = 'ff$color' : color;
    int colorInt = int.parse(color.toUpperCase(), radix: 16);
    return colorInt;
  }
}
