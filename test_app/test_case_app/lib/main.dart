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
  late TextEditingController controller, controller2;
  
  @override
  void initState() {
    controller = TextEditingController();
    controller2 = TextEditingController();
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
          title: const Text(
            "로그인",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: "ID를 입력하시오",
                  ),
                ),
                TextField(
                  controller: controller2,
                  decoration: const InputDecoration(
                    labelText: "Password를 입력하시오",
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    loginCheck();
                  }, 
                  child: const Text("로그인"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // functions
  loginCheck() {
    if(controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("ID를 입력해주세요",),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    ),
      );
    } else if (controller2.text.trim().isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Password를 입력해주세요",),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    ),
      );
    } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("로그인 완료!",),
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.blue,
                    ),
      );
    }
  }
}