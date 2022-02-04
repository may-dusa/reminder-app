//==============================================================================

// ComponentsStyle - Default styles of components used (padding, size, etc.)

import 'package:flutter/material.dart';
import 'themes.dart';

final ButtonStyle buttonStyleFilled = ButtonStyle(
  padding: MaterialStateProperty.all(EdgeInsets.zero),
  textStyle: MaterialStateProperty.all(
      textTheme.bodyText1!.copyWith(color: ColorPalette.white)),
  backgroundColor: MaterialStateProperty.all(ColorPalette.black),
  foregroundColor: MaterialStateProperty.all(ColorPalette.white),
  elevation: MaterialStateProperty.all(0),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  )),
  animationDuration: const Duration(milliseconds: 200),
  minimumSize: MaterialStateProperty.all(const Size(48, 48)),
);

final ButtonStyle buttonStyleNotFilled = ButtonStyle(
  padding: MaterialStateProperty.all(EdgeInsets.zero),
  textStyle: MaterialStateProperty.all(
      textTheme.bodyText1!.copyWith(color: ColorPalette.white)),
  backgroundColor: MaterialStateProperty.all(Colors.transparent),
  foregroundColor: MaterialStateProperty.all(ColorPalette.black),
  elevation: MaterialStateProperty.all(0),
  shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  )),
  animationDuration: const Duration(milliseconds: 200),
  minimumSize: MaterialStateProperty.all(const Size(48, 48)),
);

final InputDecoration inputDecoration = InputDecoration(
    hintStyle: textTheme.bodyText1!.copyWith(color: ColorPalette.grayLight),
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    filled: true,
    fillColor: ColorPalette.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.transparent,
        )),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        width: 1,
        color: ColorPalette.blackLight,
      ),
    ));
