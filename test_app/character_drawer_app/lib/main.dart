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
  late TextEditingController controller;
  late String adv_p;
  late List adv_res;
  late int adv_st;

  @override
  void initState() {
    controller = TextEditingController();
    adv_p = "";
    adv_res = [];
    adv_st = 0;
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      changeCharacter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LED 광고",
        ),
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
      drawer: Drawer(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 320,
                    height: 200,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "광고 문구를 입력하세요",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: "글자를 입력하세요",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    child: OutlinedButton(
                      onPressed: () {
                        getCharacter(context);
                      },
                      style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          )),
                      child: const Text("광고 문구 생성"),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }

  // functions
  getCharacter(BuildContext context) {
    setState(() {
      adv_res = controller.text.split("");
      Navigator.pop(context);
    });
  }

  changeCharacter() {
    setState(() {
      adv_st++;
      if (adv_st >= adv_res.length) {
        adv_p = adv_res[0];
        adv_st = 0;
      } else {
        adv_p += adv_res[adv_st];
      }
    });
  }
}
