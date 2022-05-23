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
  // Property
  late String _imageName;
  late bool _imageState;

  @override
  void initState() {
    _imageName = "images/lamp_on.png";
    _imageState = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alert를 이용한 메세지 출력",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _imageName,
              width: 200,
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      clickOn(context);
                    },
                    child: const Text("켜기"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      clickOff(context);
                    },
                    child: const Text("끄기"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Functions
  clickOn(BuildContext context) {
    if (_imageState) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("경고"),
              content: const Text("현재 램프가 켜진 상태 입니다."),
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("네, 알겠습니다.")),
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("램프 켜기"),
              content: const Text("램프를 키시겠습니까?"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _imageName = "images/lamp_on.png";
                            _imageState = true;
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("네")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("아니오")),
                  ],
                ),
              ],
            );
          });
    }
  }

  clickOff(BuildContext context) {
    if (_imageState) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("램프 끄기"),
              content: const Text("램프를 끄시겠습니까?"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _imageName = "images/lamp_off.png";
                            _imageState = false;
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("네")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("아니오")),
                  ],
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("경고"),
              content: const Text("현재 램프가 꺼진 상태 입니다."),
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("네, 알겠습니다.")),
                )
              ],
            );
          });
    }
  }
}
