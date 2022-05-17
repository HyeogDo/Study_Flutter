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
      backgroundColor: const Color.fromARGB(255, 255, 100, 0),
      appBar: AppBar(
        title: const Text(
          "Image Ex01",
        ),
        backgroundColor: Colors.green,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/pikachu-1.jpg"),
                radius: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/pikachu-2.jpg"),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/pikachu-3.jpg"),
                    radius: 50,
                  ),
                ),

              ],
            )


          ],
        ),
      ),
    );
  }
}