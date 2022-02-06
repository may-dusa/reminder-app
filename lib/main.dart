import 'package:flutter/material.dart';

import 'screens/newtask.dart';
import 'screens/homepage.dart';

void main(List<String> args) {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

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
