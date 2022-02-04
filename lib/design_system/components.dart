// Components - Default Components
import 'package:flutter/material.dart';
import 'component_themes.dart';
import 'themes.dart';

Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}
// Buttons

class DefaultButton extends TextButton {
  DefaultButton({
    Key? key,
    required Function() onPressFn,
    IconData? icon,
    String? title,
    bool isFilled = true,
    bool isExpanded = false,
  })  : assert(icon != null || title != null),
        super(
          key: key,
          onPressed: onPressFn,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    size: 24,
                  ),
                if (icon != null && title != null)
                  const SizedBox(
                    width: 12,
                  ),
                if (title != null)
                  Text(
                    title,
                    style: textTheme.bodyText1!.copyWith(
                        color:
                            isFilled ? ColorPalette.white : ColorPalette.black),
                  ),
              ],
            ),
          ),
          style: isFilled ? buttonStyleFilled : buttonStyleNotFilled,
        );
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

  final Color theme;
  final List<String>? tags;
  final String title;
  final String? subtitle;
  final String deadlineDate = DateTime.now().day.toString();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme,
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
            style: textTheme.headline2!.copyWith(color: darken(theme, 50)),
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
                      color: darken(theme, 50),
                      size: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "11 October",
                      style: textTheme.bodyText1!
                          .copyWith(color: darken(theme, 50)),
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
                      color: darken(theme, 50),
                      size: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "09:00 P.M.",
                      style: textTheme.bodyText1!
                          .copyWith(color: darken(theme, 50)),
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
                color: lighten(theme, 20),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: darken(theme, 50), width: 1)),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 11),
            margin: const EdgeInsets.only(bottom: 16, right: 8),
            child: Text(
              t,
              style: textTheme.bodyText1!.copyWith(color: darken(theme, 50)),
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
        style: textTheme.bodyText1!.copyWith(color: darken(theme, 20)),
      ),
    );
  }
}

class InputField extends TextField {
  InputField({
    Key? key,
    required String hintText,
    required TextEditingController tec,
    bool para = false,
    bool date = false,
  }) : super(
          controller: tec,
          decoration: inputDecoration.copyWith(hintText: hintText),
          style: textTheme.bodyText1,
          textAlign: TextAlign.left,
          textAlignVertical: TextAlignVertical.top,
          maxLines: para ? 8 : 1,
          keyboardType: date
              ? TextInputType.datetime
              : para
                  ? TextInputType.multiline
                  : TextInputType.name,
        );
}

class DateField extends GestureDetector {
  DateField({
    Key? key,
    required IconData icon,
    required String hintText,
    required Function() onPressFn,
  }) : super(
          key: key,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorPalette.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: ColorPalette.gray,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  hintText,
                  style: textTheme.bodyText1!
                      .copyWith(color: ColorPalette.grayLight),
                ),
              ],
            ),
          ),
          onTap: onPressFn,
        );

  factory DateField.date(Function() onPressFn) {
    return DateField(
        icon: Icons.event, hintText: "DD / MM / YYY", onPressFn: onPressFn);
  }

  factory DateField.time(Function() onPressFn) {
    return DateField(
        icon: Icons.watch_later, hintText: "HH : MM A/P", onPressFn: onPressFn);
  }
}
