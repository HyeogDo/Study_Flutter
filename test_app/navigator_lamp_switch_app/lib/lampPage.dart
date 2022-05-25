

import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/lamp.dart';

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
    Lamp.imagePath = imagePath;
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
                  imagePath = Lamp.imagePath;
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