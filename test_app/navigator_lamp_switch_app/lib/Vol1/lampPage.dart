

import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/Vol1/lamp.dart';

class LampPage extends StatefulWidget {
  const LampPage({Key? key}) : super(key: key);

  @override
  State<LampPage> createState() => _LampPageState();
}

class _LampPageState extends State<LampPage> {
  late String imagePath;

  @override
  void initState() {
    imagePath = "images/lamp_on.png";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main 화면",),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "editPage").then((value) => {
                setState(() {
                  if (!Lamp.lampState) {
                    imagePath = "images/lamp_off.png";
                  } else {
                    if (Lamp.lampCol) {
                      imagePath = "images/lamp_red.png";
                    } else {
                      imagePath = "images/lamp_on.png";
                    }
                  }
                })
              });
            }, 
            icon: const Icon(Icons.edit,),),
        ],
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}