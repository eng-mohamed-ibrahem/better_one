import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(_hexColorToInt(hexColor));

  static int _hexColorToInt(String color) {
    color = color.toLowerCase();
    color = color.contains('#') ? color.split('#').removeAt(0) : color;
    color.length == 6 ? color = 'ff$color' : color;
    int colorInt = int.parse(color, radix: 16);
    return colorInt;
  }
}
