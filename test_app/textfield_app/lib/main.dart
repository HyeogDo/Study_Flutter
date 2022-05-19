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
  late TextEditingController textEditingController;
  // 매번 setState로 작업해주기 귀찮아서 만들어둔 컨트롤러

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 바탕 아무곳이나 누르면 키보드 내려가게 하기!
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Single TextField",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: "글자를 입력하세요"),
                keyboardType: TextInputType.text, // 입력하는 텍스트 타입 정해주는 거
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // 사용자의 입력 내용 확인
                  // textEditingController.text에 사용자가 입력한 내용이 들어옴
                  if (textEditingController.text.trim().isEmpty) {
                    errorSnackBar(context);
                  } else {
                    showSnackBar(context);
                  }
                },
                child: const Text("출력"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions
  // Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "글자를 입력하세요",
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  // Desc : 정상적으로 입력한 글자 보여주기
  showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "입력하신 글자는 ${textEditingController.text.trim()} 입니다.",
        ),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
