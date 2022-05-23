
import 'package:bmi_team_app/kweon/calPage.dart';
import 'package:bmi_team_app/mainPage.dart';
import 'package:bmi_team_app/kweon/resultPage.dart';
import 'package:bmi_team_app/kweon/startPage.dart';
import 'package:bmi_team_app/seonga/bmi_result.dart';
import 'package:bmi_team_app/sungkyu/second.dart';
import 'package:bmi_team_app/taeun/bmiinsert.dart';
import 'package:bmi_team_app/taeun/bmiresult.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "mainPage" : (context) => const MainPage(),
        "startPage" :(context) => const StartPage(),
        "calPage" :(context) => const CalPage(),
        "resultPage" :(context) => const ResultPage(),
        'seounga2': (context) => const Second(),
        'sungkyu' :(context) => const SecondPage(),
        'bmiinsert' :(context) => const BmiInsert(),
        'bmiresult' :(context) => const BmiResult(),
      },
      initialRoute: "mainPage",
      debugShowCheckedModeBanner: false,
    );
  }
}
