import 'package:flutter/material.dart';
import 'package:flutter_reminders/common/components.dart';
import 'package:flutter_reminders/common/themes.dart';

List<TaskCard> total = [];

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
                      theme: _result[2],
                      tags: _result[3],
                    );

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
