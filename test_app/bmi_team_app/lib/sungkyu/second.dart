import 'dart:math';

import 'package:bmi_team_app/sungkyu/message.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  double dbmi = Message.weight / pow((Message.height / 100), 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('BMI 계산결과'),        
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text('당신의 BMI는 ${dbmi.toStringAsFixed(2)} 입니다.',
            style: const TextStyle(fontSize: 20),),
            const SizedBox(height: 10,),
            Image.asset(imagePath()),
          ],
        ),
      ),
    );
  }

  String imagePath() {
    String path = "";

    if(dbmi >= 35) {
      path = 'images/under_35.png';
    }else if (dbmi >= 30) {
      path = 'images/under_34_9.png';
    }else if (dbmi >= 25) {
      path = 'images/under_29_9.png';
    }else if(dbmi >= 18.5) {
      path = 'images/under_24_9.png';
    }else{
      path = 'images/under_18_5.png';
    }

    return path;
  }
} // End