import 'dart:math';

import 'package:flutter/material.dart';

class ColorUtils{
   static Color get randomColor {
    final random = Random();
    // Generate random RGB values
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);

    // Create and return the color object
    return Color.fromRGBO(red, green, blue, 1);
  }
}
