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
  late TextEditingController textEditingController1,
      textEditingController2,
      textEditingController_add,
      textEditingController_sub,
      textEditingController_mul,
      textEditingController_div;
  late bool addValue, subValue, mulValue, divValue, selectall;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController_add = TextEditingController();
    textEditingController_sub = TextEditingController();
    textEditingController_mul = TextEditingController();
    textEditingController_div = TextEditingController();
    addValue = false;
    subValue = false;
    mulValue = false;
    divValue = false;
    selectall = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("간단한 덧셈 계산기"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: textEditingController1,
                    decoration: const InputDecoration(
                      labelText: "첫번째 숫자를 입력하세요",
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: const BorderSide(width: 1, color: Colors.blue),
                      //   borderRadius: BorderRadius.circular(15),
                      // ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      removeall2();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: textEditingController2,
                    decoration: const InputDecoration(
                      labelText: "두번째 숫자를 입력하세요",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      removeall2();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      calculate(context);
                    },
                    icon: const Icon(Icons.menu),
                    label: const Text(
                      "계산",
                    ),
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(1000, 40)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      removeall();
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text(
                      "지우기",
                    ),
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(1000, 40)),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                  ),
                  Row(
                    children: [
                      const Text("덧셈",),
                      Switch(
                        value: addValue, 
                        onChanged: (value) {
                          setState(() {
                            addValue = value;
                          });
                          add();
                        },
                      ),
                      const Text("뺄셈",),
                      Switch(
                        value: subValue, 
                        onChanged: (value) {
                          setState(() {
                            subValue = value;
                          });
                          sub();
                        },
                      ),
                      const Text("곱셈",),
                      Switch(
                        value: mulValue, 
                        onChanged: (value) {
                          setState(() {
                            mulValue = value;
                          });
                          mul();
                        },
                      ),
                      const Text("나눗셈",),
                      Switch(
                        value: divValue, 
                        onChanged: (value) {
                          setState(() {
                            divValue = value;
                          });
                          div();
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("전체선택",),
                      Switch(
                        value: selectall, 
                        onChanged: (value) {
                          setState(() {
                            selectall = value;
                            addValue = value;
                            subValue = value;
                            mulValue = value;
                            divValue = value;
                          });
                          calculate(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: textEditingController_add,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "덧셈 결과",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textEditingController_sub,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "뺄셈 결과",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textEditingController_mul,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "곱셈 결과",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textEditingController_div,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "나눗셈 결과",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions

  // 계산 진행 함수
  calculate(BuildContext context) {
    if (textEditingController1.text.isEmpty ||
        textEditingController2.text.isEmpty) {
      showSnackBar(context, "숫자를 입력해주세요", Colors.red);
    } else {
      showSnackBar(context, "계산을 진행합니다.", Colors.blue);
      add();
      sub();
      mul();
      div();
      if (addValue && subValue && mulValue && divValue) {
        setState(() {
          selectall = true;
        });
      } else {
        selectall = false;
      }
    }
  }

  add() {
          if (addValue) {
        textEditingController_add.text = (int.parse(textEditingController1.text) +
                int.parse(textEditingController2.text))
            .toString();
      } else {
        textEditingController_add.text = "";
      }
            if (addValue && subValue && mulValue && divValue) {
        setState(() {
          selectall = true;
        });
      } else {
        selectall = false;
      }
  }

  sub() {
          if (subValue) {
        textEditingController_sub.text = (int.parse(textEditingController1.text) -
                int.parse(textEditingController2.text))
            .toString();
      } else {
        textEditingController_sub.text = "";
      }
            if (addValue && subValue && mulValue && divValue) {
        setState(() {
          selectall = true;
        });
      } else {
        selectall = false;
      }
  }

  mul() {
          if (mulValue) {
        textEditingController_mul.text = (int.parse(textEditingController1.text) *
                int.parse(textEditingController2.text))
            .toString();
      } else {
        textEditingController_mul.text = "";
      }
            if (addValue && subValue && mulValue && divValue) {
        setState(() {
          selectall = true;
        });
      } else {
        selectall = false;
      }
  }

  div() {
      if (divValue) {
        textEditingController_div.text = (int.parse(textEditingController1.text) /
                int.parse(textEditingController2.text))
            .toStringAsFixed(3);
      } else {
        textEditingController_div.text = "";
      }
            if (addValue && subValue && mulValue && divValue) {
        setState(() {
          selectall = true;
        });
      } else {
        selectall = false;
      }
  }
  // 결과 지우기 함수
  removeall() {
    showSnackBar(context, "결과값을 삭제합니다.", Colors.red);
    textEditingController_add.text = "";
    textEditingController_sub.text = "";
    textEditingController_mul.text = "";
    textEditingController_div.text = "";
  }

  removeall2() {
        textEditingController_add.text = "";
    textEditingController_sub.text = "";
    textEditingController_mul.text = "";
    textEditingController_div.text = "";
  }

  // snackbar 제공 함수
  showSnackBar(BuildContext context, String result, Color col) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          result,
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: col,
      ),
    );
  }
}
