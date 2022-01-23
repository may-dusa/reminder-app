import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_reminders/create_new.dart';
import 'theme.dart';

void main(List<String> args) {
  runApp(MyApp());
}

List<TaskData> total = [];

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: inputTheme,
        textTheme: textTheme,
        appBarTheme: appBarTheme,
        floatingActionButtonTheme: fabTheme,
        colorScheme: colorScheme,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'new': (context) => CreateNewTask(),
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
  @override
  Widget build(BuildContext context) {
    final TextTheme themerText = Theme.of(context).textTheme;
    final ColorScheme themerCol = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, double.maxFinite),
        child: CustomAppBar(
          title: 'Your tasks',
          rightWidget: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1385&q=80",
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'new').then((value) {
              var t = value as List;
              total.add(TaskData(title: t[0], description: t[1], color: t[2]));
              setState(() {});
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              'Create new task',
              style:
                  themerText.bodyText1!.copyWith(color: themerCol.onSecondary),
            ),
          )),
      body: Container(
        margin: const EdgeInsets.all(16.0),
        child: total.isEmpty
            ? const EmptyReminderList()
            : GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemCount: total.length,
                itemBuilder: (context, index) {
                  return ReminderCard(
                    title: total[index].title,
                    description: total[index].description,
                    color: total[index].color,
                  );
                },
              ),
      ),
    );
  }
}

class EmptyReminderList extends StatelessWidget {
  const EmptyReminderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textT = Theme.of(context).textTheme;
    final colT = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/empty.png",
            width: double.infinity,
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 64),
            child: Column(
              children: [
                Text(
                  "No Reminders",
                  style: textT.headline2,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Create a reminder and it will show up here.",
                  style: textT.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
