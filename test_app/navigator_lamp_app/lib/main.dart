import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/editPage.dart';
import 'package:navigator_lamp_app/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "mainPage" :(context) => const MainPage(),
        "editPage" :(context) => const EditPage(),
      },
      initialRoute: "mainPage",
    );
  }
}
