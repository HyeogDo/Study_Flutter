

import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final bool lampColor;
  final bool lampState;
  const EditPage({Key? key, required this.lampColor, required this.lampState}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late String lampCol;
  late bool colSwitch;
  late String lampOnOff;
  late bool onoffSwitch;

  @override
  void initState() {
    colSwitch = widget.lampColor;
    onoffSwitch = widget.lampState;
    if (onoffSwitch) {
      lampOnOff = "On";
    } else {
      lampOnOff = "Off";
    }
    if (colSwitch) {
      lampCol = "Red";
    } else {
      lampCol = "Yellow";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수정화면",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(lampCol,),
                Switch(
                  value: colSwitch, 
                  onChanged: (value) {
                    setState(() {
                      colSwitch = value;
                      if (colSwitch) {
                        lampCol = "Red";
                      } else {
                        lampCol = "Yellow";
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(lampOnOff,),
                Switch(
                  value: onoffSwitch, 
                  onChanged: (value) {
                    setState(() {
                      onoffSwitch = value;
                      if (onoffSwitch) {
                        lampOnOff = "On";
                      } else {
                        lampOnOff = "Off";
                      }
                    });
                  },
                ),

              ],
            ),
            ElevatedButton(
              onPressed: () {
                List<bool> result = [];
                result.add(colSwitch);
                result.add(onoffSwitch);
                Navigator.pop(context, result);
              }, 
              child: const Text("OK"),
              ),
          ],
        ),
      ),
    );
  }

}