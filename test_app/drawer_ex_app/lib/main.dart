import 'package:drawer_ex_app/menu.dart';
import 'package:drawer_ex_app/page1st.dart';
import 'package:drawer_ex_app/page2nd.dart';
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
        "menu" : (context) => const Menu(),
        "page1st" :(context) => const Page1st(),
        "page2nd" :(context) => const Page2nd(),
        
      },
      initialRoute: "menu",
      debugShowCheckedModeBanner: false,
    );
  }
}

