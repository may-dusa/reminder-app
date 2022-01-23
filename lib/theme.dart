import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskData {
  TaskData({
    required this.title,
    required this.description,
    required this.color,
  });

  String title;
  String description;
  Color color;
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {Key? key, this.title, this.leftWidget, required this.rightWidget})
      : super(key: key);

  final String? title;
  final Widget? leftWidget;
  final List<Widget> rightWidget;

  List<Widget> _decideChildren() {
    if (title != null && leftWidget != null) {
      return [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftWidget!,
            const SizedBox(
              width: 16,
            ),
            Text(
              title!,
              style: textTheme.headline1,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rightWidget,
        ),
      ];
    } else if (title != null && leftWidget == null) {
      return [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
              style: textTheme.headline1,
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rightWidget,
        ),
      ];
    } else if (title == null && leftWidget != null) {
      return [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftWidget!,
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rightWidget,
        ),
      ];
    } else {
      return [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rightWidget,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 48, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _decideChildren(),
      ),
    );
  }
}

//======COLOR SCHEME========

const ColorScheme colorScheme = ColorScheme(
  primary: Color.fromRGBO(48, 48, 48, 1),
  primaryVariant: Color.fromRGBO(38, 38, 38, 1),
  onPrimary: Colors.white,
  secondary: Color.fromRGBO(232, 163, 72, 1),
  secondaryVariant: Color.fromRGBO(168, 121, 59, 1),
  onSecondary: Colors.white,
  surface: Colors.white,
  onSurface: Color.fromRGBO(180, 180, 180, 1),
  background: Colors.white,
  onBackground: Color.fromRGBO(48, 48, 48, 1),
  error: Color.fromRGBO(214, 84, 84, 1),
  onError: Colors.white,
  brightness: Brightness.light,
);

//========TEXT THEME===========

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.inter(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: colorScheme.primary),
  headline2: GoogleFonts.inter(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      height: 1.2,
      color: colorScheme.primary),
  bodyText1: GoogleFonts.inter(
      fontSize: 16.0, height: 1.5, color: colorScheme.primary),
  bodyText2: GoogleFonts.inter(
    fontSize: 16.0,
    height: 1.5,
    fontWeight: FontWeight.bold,
    color: colorScheme.primary,
  ),
  caption: GoogleFonts.lato(
      fontSize: 12.0, height: 1.5, color: colorScheme.onSurface),
);

//=========FAB===========

FloatingActionButtonThemeData fabTheme = FloatingActionButtonThemeData(
  foregroundColor: colorScheme.onSecondary,
  backgroundColor: colorScheme.secondary,
  splashColor: colorScheme.secondaryVariant,
  sizeConstraints: const BoxConstraints(
    minWidth: 64,
    minHeight: 64,
  ),
  elevation: 0,
);

//=============INPUT THEME========

InputDecorationTheme inputTheme = InputDecorationTheme(
  border: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0.0,
    ),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent, width: 0.0),
  ),
  contentPadding: const EdgeInsets.all(12.0),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 0.0,
      style: BorderStyle.solid,
    ),
  ),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0.0,
      style: BorderStyle.solid,
    ),
  ),
  hintStyle: textTheme.bodyText1,
);

//============APP BAR=============

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Colors.transparent,
  shadowColor: Colors.transparent,
  actionsIconTheme: IconThemeData(
    color: colorScheme.primary,
    size: 32.0,
  ),
  iconTheme: IconThemeData(
    color: colorScheme.primary,
    size: 32.0,
  ),
);

//========REMINDER CARD=======

class ReminderCard extends StatelessWidget {
  const ReminderCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.color})
      : super(key: key);

  final String title, description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: textTheme.bodyText2,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
