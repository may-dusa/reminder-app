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
  static const Color grayLight = Color.fromRGBO(248, 248, 248, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  // Green

  static const Color green = Color.fromRGBO(220, 234, 135, 1);
  static const Color greenDark = Color.fromRGBO(142, 151, 89, 1);
  static const Color greenDarker = Color.fromRGBO(71, 77, 31, 1);
  static const Color greenLight = Color.fromRGBO(220, 229, 166, 1);

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

// ComponentsStyle - Default styles of components used (padding, size, etc.)

final ButtonStyle _buttonStyle = ButtonStyle(
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
  maximumSize: MaterialStateProperty.all(const Size(double.maxFinite, 48)),
);

//==============================================================================

// Components - Default Components

// Buttons

class DefaultButton extends TextButton {
  DefaultButton({
    Key? key,
    required Function() onPressFn,
    required Widget content,
    required bool isFilled,
  }) : super(
          key: key,
          onPressed: onPressFn,
          child: content,
          style: isFilled
              ? _buttonStyle
              : _buttonStyle.copyWith(
                  textStyle: MaterialStateProperty.all(textTheme.bodyText1!),
                  backgroundColor:
                      MaterialStateProperty.all(ColorPalette.white),
                  foregroundColor:
                      MaterialStateProperty.all(ColorPalette.black),
                ),
        );

  factory DefaultButton.withText({
    required String title,
    required IconData icon,
    required Function() onPressFn,
    bool isFilled = true,
  }) {
    Widget content = Row(
      children: [
        SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            icon,
            size: 24,
            color: isFilled ? ColorPalette.white : ColorPalette.black,
          ),
        ),
        Text(
          title,
        ),
      ],
    );

    return DefaultButton(
      onPressFn: onPressFn,
      content: content,
      isFilled: isFilled,
    );
  }

  factory DefaultButton.withoutText({
    required IconData icon,
    required Function() onPressFn,
    bool isFilled = true,
  }) {
    Widget content = SizedBox(
      width: 32,
      height: 32,
      child: Icon(
        icon,
        size: 24,
        color: isFilled ? ColorPalette.white : ColorPalette.black,
      ),
    );

    return DefaultButton(
      onPressFn: onPressFn,
      content: content,
      isFilled: isFilled,
    );
  }
}

// App Bar -

class DefAppBar extends StatelessWidget {
  const DefAppBar({
    Key? key,
    this.title,
    required this.leftAction,
    this.rightAction,
  }) : super(
          key: key,
        );

  final String? title;
  final DefaultButton leftAction;
  final DefaultButton? rightAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftAction,
              const SizedBox(
                width: 8,
              ),
              if (title != null)
                Text(
                  title!,
                  style: textTheme.headline1,
                ),
            ],
          ),
          if (rightAction != null) rightAction!,
        ],
      ),
    );
  }
}

// Cards

class TaskCard extends StatelessWidget {
  TaskCard({
    Key? key,
    required this.theme,
    this.tags,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  final List<Color> theme;
  final List<String>? tags;
  final String title;
  final String? subtitle;
  final String deadlineDate = DateTime.now().day.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme[1],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tags != null) _createTags(),
          Text(
            title,
            style: textTheme.headline2!.copyWith(color: theme[3]),
          ),
          if (subtitle != null) _createSubtitle(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.event,
                      color: theme[3],
                      size: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "11 October",
                      style: textTheme.bodyText1!.copyWith(color: theme[3]),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.schedule,
                      color: theme[3],
                      size: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "09:00 P.M.",
                      style: textTheme.bodyText1!.copyWith(color: theme[3]),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row _createTags() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var t in tags!)
          Container(
            decoration: BoxDecoration(
                color: theme[0],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme[3], width: 1)),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
            margin: const EdgeInsets.only(bottom: 16, right: 8),
            child: Text(
              t,
              style: textTheme.bodyText1!.copyWith(color: theme[3]),
            ),
          ),
      ],
    );
  }

  Container _createSubtitle() {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Text(
        subtitle!,
        style: textTheme.bodyText1!.copyWith(color: theme[2]),
      ),
    );
  }
}
