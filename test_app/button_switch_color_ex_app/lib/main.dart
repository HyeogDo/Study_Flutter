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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color _buttonColor;
  late bool _switchState;

  @override
  void initState() {
    _buttonColor = Colors.blue;
    _switchState = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Changed Button color on Switch",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                _buttonColor,
              )),
              child: const Text("Flutter"),
            ),
            const SizedBox(
              height: 30,
            ),
            Switch(
              value: _switchState,
              onChanged: (value) {
                setState(() {
                  _switchState = value;
                  if (_switchState) {
                    _buttonColor = Colors.red;
                  } else {
                    _buttonColor = Colors.blue;
                  }
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
