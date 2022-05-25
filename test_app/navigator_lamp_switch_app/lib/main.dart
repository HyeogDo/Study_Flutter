import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/editPage.dart';
import 'package:navigator_lamp_switch_app/lampPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "lampPage":(context) => const LampPage(),
        "editPage":(context) => const EditPage(),
      },
      initialRoute: "lampPage",
    );
  }
}
