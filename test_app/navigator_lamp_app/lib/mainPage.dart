import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController controller;
  late String imagePath;
  late bool imageState;

  @override
  void initState() {
    controller = TextEditingController();
    imagePath = "images/lamp_on.png";
    imageState = true;
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
          title: const Text("Main 화면"),
          leading: IconButton(
              onPressed: () {
                //
              },
              icon: const Icon(Icons.home)),
          actions: [
            IconButton(
              onPressed: () {
                Message.message = controller.text;
                Navigator.pushNamed(context, "editPage")
                    .then((value) => changeImage());
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text(
                      "글자를 입력해주세요",
                    ),
                  ),
                ),
              ),
              Image.asset(
                imagePath,
                width: 200,
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }

  changeImage() {
    setState(() {
      if (Message.imageState) {
        imagePath = "images/lamp_on.png";
      } else {
        imagePath = "images/lamp_off.png";
      }
      controller.text = Message.message;
    });
  }
}
