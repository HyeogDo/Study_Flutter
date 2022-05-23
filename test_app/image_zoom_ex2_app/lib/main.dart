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
        primarySwatch: Colors.green,
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
  // Property
  late bool _imageSize, _switch, _imageColor;
  late String _imageName;
  late double _imageWidth, _imageHeight;

  @override
  void initState() {
    _imageSize = false;
    _switch = true;
    _imageColor = false;
    _imageName = "images/lamp_on.png";
    _imageWidth = 150;
    _imageHeight = 300;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Image 확대 및 축소"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _imageName,
                    width: _imageWidth,
                    height: _imageHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "전구 색깔",
                      style: TextStyle(color: Colors.white),
                    ),
                    Switch(
                      value: _imageColor,
                      onChanged: (value) {
                        setState(() {
                          _imageColor = value;
                          decisionOnOff();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    const Text(
                      "전구 확대",
                      style: TextStyle(color: Colors.white),
                    ),
                    Switch(
                      value: _imageSize,
                      onChanged: (value) {
                        setState(() {
                          _imageSize = value;
                          decisionSize();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    const Text(
                      "전구 스위치",
                      style: TextStyle(color: Colors.white),
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                          decisionOnOff();
                          decisionSize();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // functions
  decisionOnOff() {
    if (_switch) {
      if (_imageColor) {
        _imageName = "images/lamp_red.png";
      } else {
        _imageName = "images/lamp_on.png";
      }
    } else {
      _imageName = "images/lamp_off.png";
    }
  }

  decisionSize() {
    if (_imageSize && _switch) {
      _imageWidth = 300;
      _imageHeight = 600;
    } else if (!_imageSize && _switch){
      _imageWidth = 150;
      _imageHeight = 300;
    }
  }
}
