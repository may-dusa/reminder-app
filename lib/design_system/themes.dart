import 'dart:developer';

import 'package:flutter/material.dart';

// Default Theme - This theme (text & color) is the base for all the components
// used.

// Color Theme

class ColorPalette {
  ColorPalette._();

  // Neutrals

  static const Color black = Color.fromRGBO(10, 10, 10, 1);
  static const Color blackLight = Color.fromRGBO(50, 50, 50, 1);
  static const Color gray = Color.fromRGBO(102, 102, 102, 1);
  static const Color grayLight = Color.fromRGBO(199, 199, 199, 1);
  static const Color grayLighter = Color.fromRGBO(245, 245, 245, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  // Green

  static const Color green = Color.fromRGBO(220, 234, 135, 1);
  static const Color greenDark = Color.fromRGBO(142, 151, 89, 1);
  static const Color greenDarker = Color.fromRGBO(71, 77, 31, 1);
  static const Color greenLight = Color.fromRGBO(220, 229, 166, 1);

  static const Color ochre = Color.fromRGBO(232, 203, 129, 1);
  static const Color pink = Color.fromRGBO(235, 197, 236, 1);
  static const Color purple = Color.fromRGBO(184, 195, 232, 1);
  static const Color cyan = Color.fromRGBO(163, 226, 222, 1);

  // Orange

  static const Color orange = Color.fromRGBO(234, 177, 135, 1);
  static const Color orangeDark = Color.fromRGBO(164, 107, 65, 1);
  static const Color orangeDarker = Color.fromRGBO(92, 57, 32, 1);
  static const Color orangeLight = Color.fromRGBO(235, 190, 156, 1);
}

// Text Theme

const TextTheme textTheme = TextTheme(
  headline1: TextStyle(
    fontFamily: "Roboto",
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: ColorPalette.black,
  ),
  headline2: TextStyle(
    fontFamily: "Roboto",
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.3,
    color: ColorPalette.black,
  ),
  bodyText1: TextStyle(
    fontFamily: "Roboto",
    fontSize: 12,
    height: 1.3,
    color: ColorPalette.black,
  ),
  bodyText2: TextStyle(
    fontFamily: "Roboto",
    fontSize: 16,
    height: 1.5,
    color: ColorPalette.black,
  ),
);


//==============================================================================


