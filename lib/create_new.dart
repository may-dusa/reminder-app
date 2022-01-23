import 'dart:ui';
import 'package:flutter/material.dart';
import 'theme.dart';

class CreateNewTask extends StatefulWidget {
  CreateNewTask({Key? key}) : super(key: key);

  @override
  _CreateNewTaskState createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  String title = '', description = '';
  String? titleErr;

  void emptyValidator(String? str) {
    if (str == '') {
      titleErr = "Title cannot be empty";
      setState(() {});
    } else {
      titleErr = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final textT = Theme.of(context).textTheme;
    final colT = Theme.of(context).colorScheme;

    void popOnBack() {
      if (title == '') {
        Navigator.pop(context);
      } else if (title.isNotEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 1,
                title: Text(
                  "Discard changes?",
                  style: textT.bodyText2!.copyWith(color: colT.secondary),
                ),
                content: Text(
                  "You have some unsaved changes",
                  style: textT.bodyText1,
                ),
                actions: [
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text(
                        "Discard",
                        style: textT.bodyText1,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Save",
                        style: textT.bodyText1,
                      ),
                    ),
                  ),
                ],
              );
            });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, double.maxFinite),
        child: CustomAppBar(
          leftWidget: IconButton(
            onPressed: () {
              popOnBack();
            },
            iconSize: 24.0,
            icon: const Icon(Icons.arrow_back),
          ),
          rightWidget: [
            IconButton(
              onPressed: () {},
              iconSize: 24.0,
              icon: const Icon(Icons.bookmark_outline),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 24.0,
              icon: const Icon(Icons.notifications_outlined),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [title, description, cardColors[selectedIndex]]);
        },
        child: Icon(
          Icons.add,
          color: colT.onSecondary,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                emptyValidator(value.toString());
                title = value.toString();
              },
              decoration: InputDecoration(
                hintText: "Create a title",
                hintStyle: textT.headline2!.copyWith(color: colT.onSurface),
                errorText: titleErr,
              ),
              style: textT.headline2,
            ),
            TextField(
              onChanged: (value) {
                description = value.toString();
              },
              maxLines: 16,
              decoration: InputDecoration(
                hintText: "Write a description",
                hintStyle: textT.bodyText1!.copyWith(color: colT.onSurface),
              ),
              style: textT.bodyText1,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: colT.onSurface,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List<Widget>.generate(4, (index) {
                  bool chck = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 16),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: chck ? colT.onSurface : Colors.transparent,
                            width: 2.0),
                        borderRadius: BorderRadius.circular(12),
                        color: cardColors[index],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

int selectedIndex = 0;

List<Color> cardColors = [
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.cyan,
  Colors.blueGrey,
];
