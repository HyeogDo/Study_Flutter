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
  late TextEditingController textEditingController1, textEditingController2;
  late int result;
  late String pstr;
  
  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    result = 0;
    pstr = "";
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
          child: Center(
            child: Column(
              children: [
                Text(
                  "덧셈 결과 : $result 입니다.",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    addition(context);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "덧셈계산",
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(1000,40)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  pstr,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions

  // 덧셈 진행 함수
  addition(BuildContext context) {
    if (textEditingController1.text.isEmpty ||
        textEditingController2.text.isEmpty) {
      showSnackBar(context, "숫자를 입력해주세요", Colors.red);
      setState(() {
        result = 0;
        pstr = "";
      });
    } else {
      showSnackBar(context, "덧셈을 진행합니다.", Colors.blue);
      setState(() {
        result = int.parse(textEditingController1.text) +
            int.parse(textEditingController2.text);
        pstr = "입력하신 숫자의 합은 $result 입니다.";
      });
    }
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
