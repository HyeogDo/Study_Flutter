

import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/editPage.dart';

class LampPage extends StatefulWidget {
  const LampPage({Key? key}) : super(key: key);

  @override
  State<LampPage> createState() => _LampPageState();
}

class _LampPageState extends State<LampPage> {
  late String imagePath;
  late bool lampState;
  late bool lampColor;

  @override
  void initState() {
    imagePath = "images/lamp_on.png";
    lampState = true;
    lampColor = false;
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditPage(lampColor: lampColor, lampState: lampState);
              },)).then((value) => {
                setState(() {
                  lampColor = value[0];
                  lampState = value[1];
                  if (!lampState) {
                    imagePath = "images/lamp_off.png";
                  } else {
                    if (lampColor) {
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