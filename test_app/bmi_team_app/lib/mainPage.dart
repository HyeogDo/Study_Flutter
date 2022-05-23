
import 'package:bmi_team_app/eunae/eunaePage.dart';
import 'package:bmi_team_app/kweon/startPage.dart';
import 'package:bmi_team_app/seonga/screen.dart';
import 'package:bmi_team_app/sungkyu/first.dart';
import 'package:bmi_team_app/taeun/home.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  // Property
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI 1조"),
      ),
      body: TabBarView(
        controller: controller,
        children: const[
          StartPage(),
          First(),
          FirstPage(),
          Home(),
          EunaePage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelColor: Colors.black,
        indicatorColor: Colors.blue,
        tabs: const[
          Tab(
            icon: Icon(
              Icons.table_bar,
            ),
            text: "권혁도",
          ),
          Tab(
            icon: Icon(
              Icons.backpack,
            ),
            text: "최승아",
          ),
          Tab(
            icon: Icon(
              Icons.access_alarms_rounded,
            ),
            text: "임성규",
          ),
          Tab(
            icon: Icon(
              Icons.yard_rounded,
            ),
            text: "김태언",
          ),
          Tab(
            icon: Icon(
              Icons.attach_money_sharp,
            ),
            text: "김은애",
          ),
        ],
        ),
    );
  }
}