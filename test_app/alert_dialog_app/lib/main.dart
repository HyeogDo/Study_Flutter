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
          "Alert Dialog with Gesture",
        ),
      ),
      body: Center(
        child: GestureDetector(
          child: const Text(
            "Hello World",
          ),
          onTap: () => _showDialog(context),
        ),
      ),
    );
  }

  // -- Functions
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Alert Title"),
          content: const Text("Hello World를 Touch \n했습니다."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("종료"),
            ),
          ],
        );
      },
    );
  }
}
