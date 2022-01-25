import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppBar extends StatefulWidget {
  const DefaultAppBar({
    Key? key,
    this.rightItems,
    required this.leftItems,
    required this.title,
    required this.hasRightItems,
  }) : super(key: key);

  final List<Widget>? rightItems;
  final List<Widget> leftItems;
  final String title;
  final bool hasRightItems;
  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Row giveRightItems() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: widget.rightItems!,
    );
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: widget.leftItems,
          ),
          Text(
            widget.title,
            style: textTheme.headline2,
          ),
          if (widget.hasRightItems) giveRightItems(),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    required this.tags,
    required this.title,
    required this.date,
    required this.time,
    required this.bgColor,
  }) : super(key: key);

  final List<String> tags;
  final String title, date, time;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bgColor,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        fit: StackFit.loose,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var s in tags) Tag(s: s),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                title,
                style: textTheme.headline2,
              ),
              const SizedBox(
                height: 16,
              ),
              IconInfo(icon: Icons.event, data: date),
              const SizedBox(
                height: 8,
              ),
              IconInfo(icon: Icons.schedule, data: time),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.edit,
                size: 12.0,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.circle_outlined,
                size: 12.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconInfo extends StatelessWidget {
  const IconInfo({Key? key, required this.icon, required this.data})
      : super(key: key);

  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 12.0,
          color: colorPalette["black"],
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          data,
          style: textTheme.caption,
        ),
      ],
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({Key? key, required this.s}) : super(key: key);

  final String s;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1.0,
          color: Colors.black.withAlpha(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      child: Text(
        s,
        style: textTheme.bodyText2,
      ),
    );
  }
}

//=======================================
//=============THEMES====================
//=======================================

Map<String, Color> colorPalette = {
  "black": const Color.fromRGBO(10, 10, 10, 1),
  "blackDark": const Color.fromRGBO(0, 0, 0, 1),
  "sky": const Color.fromRGBO(246, 247, 251, 1),
  "gray": const Color.fromRGBO(180, 180, 180, 1),
  "red": const Color.fromRGBO(238, 30, 30, 1),
  "cyan": const Color.fromRGBO(77, 239, 209, 1),
  "yellow": const Color.fromRGBO(251, 226, 21, 1),
  "blue": const Color.fromRGBO(64, 209, 241, 1),
  "purple": const Color.fromRGBO(181, 173, 255, 1),
};

TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: colorPalette["black"],
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: colorPalette["black"],
  ),
  bodyText1: GoogleFonts.poppins(
    fontSize: 16.0,
    color: colorPalette["black"],
  ),
  bodyText2: GoogleFonts.poppins(
    fontSize: 12.0,
    color: colorPalette["black"],
  ),
  caption: GoogleFonts.poppins(
    fontSize: 12.0,
    color: colorPalette["black"],
  ),
);

//======================================================
//====================BUTTON============================
//======================================================

ButtonStyle btnStyle(bool isFilled, bool isText) {
  return ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
    textStyle: MaterialStateProperty.all(textTheme.bodyText1),
    backgroundColor: MaterialStateProperty.all(
        isFilled ? colorPalette["black"] : Colors.transparent),
    foregroundColor: MaterialStateProperty.all(
        isFilled ? Colors.white : colorPalette["black"]),
    overlayColor: MaterialStateProperty.all(
        isFilled ? colorPalette["blackDark"] : colorPalette["sky"]),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    elevation: MaterialStateProperty.all(0),
    side: MaterialStateProperty.all(BorderSide.none),
    shape: MaterialStateProperty.all(isText
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          )
        : const CircleBorder()),
    splashFactory: InkSplash.splashFactory,
  );
}
