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
  late String userId;
  late String password;

  @override
  void initState() {
    controller = TextEditingController();
    controller2 = TextEditingController();
    userId = "tj";
    password = "1111";
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                    size: 130,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: "ID를 입력하시오",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                    child: TextField(
                      controller: controller2,
                      decoration: const InputDecoration(
                        labelText: "Password를 입력하시오",
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginCheck();
                    },
                    child: const Text("Log In"),
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
  loginCheck() {
    if (controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "ID를 입력해주세요",
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    } else if (controller2.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password를 입력해주세요",
          ),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (controller.text.trim() == userId) {
        if (controller2.text.trim() == password) {
          showLogin(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "사용자 ID와 암호가 맞지 않습니다!",
              ),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.blue,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "등록되지 않은 사용자 입니다.",
            ),
            duration: Duration(seconds: 1),
            backgroundColor: Colors.blue,
          ),
        );
      }
    }
  }
}

showLogin(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!!
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: const Text("환영합니다."),
        content: const Text("신분이 확인되었습니다."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
