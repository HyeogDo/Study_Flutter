
import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late List imageName;
  late int currentImage;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SimpleGestureDetector(
        // 좌우로 스와이프 할때
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageName[currentImage],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      goback();
                    }, 
                    icon: const Icon(Icons.arrow_back_ios,),
                    label: const Text(""),
                  ),
                  Image.asset(
                    "images/${imageName[currentImage]}",
                    width: 250,
                    height: 500,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      gonext();
                    }, 
                    icon: const Icon(Icons.arrow_forward_ios),
                    label: const Text(""),
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
      ),
    );
  }

  // -- Functions
  // >= 이거 안해서 그랬어...
  _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if(direction == SwipeDirection.left ) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if ( currentImage < 0) {
          currentImage = imageName.length - 1 ;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      if(direction == SwipeDirection.down ) {
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        if ( currentImage < 0) {
          currentImage = imageName.length - 1 ;
        }
      }
    });
  }

  goback() {
    setState(() {
              currentImage -= 1;
        if ( currentImage < 0) {
          currentImage = imageName.length - 1 ;
        }
    });
  }

  gonext() {
    setState(() {
              currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
    });
  }

}