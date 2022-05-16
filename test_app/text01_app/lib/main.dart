import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text Row",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "James",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cathy",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Kenny",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "James",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cathy",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Kenny",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
