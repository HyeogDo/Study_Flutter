import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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
  late List imageName;
  late int currentImage;
  late int currentImage2;

  @override
  void initState() {
    imageName = [
      "flower_01.png",
      "flower_02.png",
      "flower_03.png",
      "flower_04.png",
      "flower_05.png",
      "flower_06.png"
    ];
    currentImage = 0;
    currentImage2 = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text("Image Swiping"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageName[currentImage],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 10,
                        )),
                    child: Image.asset(
                      "images/${imageName[currentImage]}",
                      width: 400,
                      height: 600,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  left: 265,
                  top: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.amber,
                        width: 5,
                      )
                    ),
                    child: Image.asset(
                      "images/${imageName[currentImage2]}",
                      fit: BoxFit.fill, 
                      width: 100,
                      height: 150,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    goback();
                  },
                  child: const Text("<<이전"),
                ),
                const SizedBox(
                  width: 70,
                ),
                ElevatedButton(
                  onPressed: () {
                    gonext();
                  },
                  child: const Text("다음>>"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // -- Functions

  goback() {
    setState(() {
      currentImage -= 1;
      currentImage2 -= 1;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
      if (currentImage2 < 0) {
        currentImage2 = imageName.length - 1;
      }
    });
  }

  gonext() {
    setState(() {
      currentImage += 1;
      currentImage2 += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
      if (currentImage2 >= imageName.length) {
        currentImage2 = 0;
      }
    });
  }
}
