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
          "Buttons",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // 눌렀을 때 뭘 할건지
                print("Text Button");
              },
              onLongPress: () {
                print("Long pressed text button");
              },
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text(
                "TextButton",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: const Text(
                "Elevated Button",
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(
                    color: Colors.black87,
                    width: 2.0,
                  )),
              child: const Text(
                "Outlined Button",
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text("Go to home"),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {

              },
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              label: const Text(
                "home",
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                minimumSize: const Size(200, 40),
              ),
            ),

            OutlinedButton.icon(
              onPressed: () {

              }, 
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ), 
              label: const Text(
                "Go to home",
              ),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {

              }, 
              icon: const Icon(
                Icons.home,
                color: const Color.fromARGB(255, 255, 100, 100),
              ), 
              label: const Text(
                "Go to home",
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 100, 100),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 255, 220, 220),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {

                  }, 
                  child: const Text(
                    "Text Button",
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                  }, 
                  child: const Text(
                    "ElevatedButton"
                  )
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
