import 'dart:async';

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
  late String adv, adv_p;
  late List adv_res;
  late int adv_st;
  @override
  void initState() {
    adv = "대한민국";
    adv_res = adv.split("");
    adv_p = adv_res[0];
    adv_st = 0;
    super.initState();

    Timer.periodic(const Duration(seconds: 1),
     (timer) { 
       changeCharacter();
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LED 광고",),
      ),
      body: Center(
        child: Text(
          adv_p,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
      ),
    );
  }

  changeCharacter() {
    setState(() {
      adv_st++;
      if(adv_st >= adv_res.length) {
        adv_p = adv_res[0];
        adv_st=0;
      } else {
        adv_p += adv_res[adv_st];
      }

    });
  }
}