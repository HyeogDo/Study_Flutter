import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/listPage.dart';
import 'package:navigator_tabbar_ex_app/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "loginPage" :(context) => const LoginPage(),
        "listPage" :(context) => const ListPage(),
      },
      initialRoute: "loginPage",
    );
  }
}
