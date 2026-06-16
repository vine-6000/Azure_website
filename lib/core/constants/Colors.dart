import 'package:flutter/material.dart';

class AppColors {
  //soft colors
  static const Color softblack = Color.fromRGBO(18, 18, 18, 1);
  static const Color softWhite = Color.fromRGBO(248, 249, 250, 1);

  //Backgrounds
  static const Color mainBG = Color.fromRGBO(255, 249, 241, 1);
  static const Color azure = Color.fromRGBO(87, 149, 194, 1);
  //Text Colors
  static const Color lightorange = Color.fromRGBO(255, 249, 241, 1);
  static const Color vividorange = Color.fromRGBO(219, 72, 9, 1);

  //Element  Colors
  static const Color lightgrey = Color.fromRGBO(240, 239, 238, 1);

  //Selected
  static const Color midnightluxury = Color.fromRGBO(26, 36, 43, 0.5);

  //Personal Gradients
  static const Gradient darkgradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(18, 16, 14, 1), // purple-900
      Color.fromRGBO(31, 32, 29, 1), // blue-900
      Color.fromRGBO(64, 64, 62, 1), // indigo-900
    ],
  );

  // Coo
}
