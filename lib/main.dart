import 'package:flutter/material.dart';
import 'themes.dart';

void main(List<String> args) {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

List<Color> greenTheme = [
  ColorPalette.greenLight,
  ColorPalette.green,
  ColorPalette.greenDark,
  ColorPalette.greenDarker,
];

List<Color> orangeTheme = [
  ColorPalette.orangeLight,
  ColorPalette.orange,
  ColorPalette.orangeDark,
  ColorPalette.orangeDarker,
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
      },
      initialRoute: "/",
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(96),
          child: DefAppBar(
            leftAction: DefaultButton.withoutText(
                icon: Icons.dashboard, onPressFn: () {}),
            rightAction: DefaultButton.withoutText(
              icon: Icons.notifications,
              onPressFn: () {},
              isFilled: false,
            ),
          ),
        ),
        backgroundColor: ColorPalette.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey Ishaan!",
                style: textTheme.bodyText2,
              ),
              Text(
                "Here are today's tasks",
                style: textTheme.headline1,
              ),
              const SizedBox(
                height: 24,
              ),
              TaskCard(
                theme: greenTheme,
                title: "Complete part 3 of post!",
                subtitle: "Cover the remaining points",
                tags: const ["Work", "Urgent"],
              ),
              TaskCard(
                theme: orangeTheme,
                title: "Complete part 3 of post!",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
