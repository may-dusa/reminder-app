import 'package:flutter/material.dart';
import 'design_system/themes.dart';
import 'design_system/components.dart';

import 'new_task.dart';

void main(List<String> args) {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

List<TaskCard> total = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "new": (context) => const NewTaskPage(),
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: DefAppBar(
            leftAction: DefaultButton(icon: Icons.dashboard, onPressFn: () {}),
            rightAction: DefaultButton(
              icon: Icons.notifications,
              onPressFn: () {},
              isFilled: false,
            ),
          ),
        ),
        bottomSheet: Container(
          height: 120,
          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(color: Colors.transparent)],
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.white, Colors.white.withOpacity(0)])),
          child: Center(
            child: DefaultButton(
                title: "Add task",
                icon: Icons.add_circle,
                onPressFn: () {
                  Navigator.pushNamed(context, "new").then((value) {
                    var _result = value as List;
                    var temp = TaskCard(
                        title: _result[0],
                        subtitle: _result[1],
                        theme: _result[2]);

                    setState(() {
                      total.add(temp);
                    });
                  });
                }),
          ),
        ),
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
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: total.length,
                  itemBuilder: (context, index) => total[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
