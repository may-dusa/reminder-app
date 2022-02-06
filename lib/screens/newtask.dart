import 'package:flutter/material.dart';
import '../common/themes.dart';
import '../common/components.dart';

List<Color> colors = [
  ColorPalette.green,
  ColorPalette.orange,
  ColorPalette.ochre,
  ColorPalette.pink,
  ColorPalette.purple,
  ColorPalette.cyan,
];

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  String title = '';
  String dec = '';
  String date = '';
  String time = '';
  int _selectedInd = 0;

  List<String> tags = ["Work", "Urgent"];

  final List<TextEditingController> _tec =
      List.generate(2, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: DefAppBar(
            leftAction: DefaultButton(
              icon: Icons.arrow_back,
              onPressFn: () {
                Navigator.pop(context);
              },
              isFilled: false,
            ),
            title: "Add Task",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.grayLighter,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(tags.length + 1, (index) {
                              if (index == tags.length) {
                                return AddTagButton();
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: TagButton(
                                    title: tags[index],
                                    isRemovable: true,
                                  ),
                                );
                              }
                            }),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "TITLE",
                            style: textTheme.bodyText1!
                                .copyWith(color: ColorPalette.gray),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputField(
                            tec: _tec[0],
                            hintText:
                                "Usually the name of the task goes here..",
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "DESCRIPTION (Optional)",
                            style: textTheme.bodyText1!
                                .copyWith(color: ColorPalette.gray),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputField(
                            tec: _tec[1],
                            hintText:
                                "A few lines to easily identify the task..",
                            para: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.grayLighter,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DEADLINE",
                            style: textTheme.bodyText1!
                                .copyWith(color: ColorPalette.gray),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: DateField.date(() {
                                  showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(
                                        DateTime.now().year + 1,
                                      ));
                                }),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: DateField.time(() {
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now());
                                }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorPalette.grayLighter,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CHOOSE THEME",
                            style: textTheme.bodyText1!
                                .copyWith(color: ColorPalette.gray),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                              children: List.generate(
                            colors.length,
                            (index) {
                              bool selected = _selectedInd == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedInd = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                      color: colors[index],
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        width: 2,
                                        color: selected
                                            ? ColorPalette.black
                                            : Colors.transparent,
                                      )),
                                ),
                              );
                            },
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DefaultButton(
                title: "Create Task",
                onPressFn: () {
                  Navigator.pop(context, [
                    _tec[0].text,
                    _tec[1].text,
                    colors[_selectedInd],
                    tags,
                  ]);
                },
                isExpanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
