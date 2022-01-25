import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'themes.dart';

void main(List<String> args) {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.white),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: fabTheme,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tabText = ["Today", "Upcoming", "Completed"];
  int selectedInd = 0;

  List<Widget> totalTasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, double.maxFinite),
          child: DefaultAppBar(
            hasRightItems: true,
            leftItems: [
              TextButton(
                style: btnStyle(true, false),
                child: const Icon(
                  Icons.dashboard_outlined,
                  size: 16.0,
                ),
                onPressed: () {},
              ),
            ],
            title: "Your Tasks",
            rightItems: [
              TextButton(
                style: btnStyle(false, false),
                child: const Icon(
                  Icons.notifications_outlined,
                  size: 16.0,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            size: 12,
          ),
          label: Text(
            "Add task",
            style: textTheme.bodyText2!.copyWith(color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //======Greetings and search========
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back!",
                        style: textTheme.bodyText1,
                      ),
                      Text(
                        "Here's today's updates",
                        style: textTheme.headline1,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 16,
                  ),

                  //======Tabs===
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (var t in tabText)
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () {
                              selectedInd = tabText.indexOf(t);
                              setState(() {});
                            },
                            child: Text(t),
                            style: btnStyle(
                                    tabText.indexOf(t) == selectedInd, true)
                                .copyWith(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 2,
                                ),
                              ),
                              textStyle: MaterialStateProperty.all(
                                  textTheme.bodyText2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          tags: const ["School", "Work"],
                          title: "Taking my sister to school",
                          date: "12 October 2021",
                          time: "07 : 30",
                          bgColor: colorPalette["cyan"]!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white.withAlpha(0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
