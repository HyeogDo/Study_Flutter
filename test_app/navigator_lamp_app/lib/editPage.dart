import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController controller;
  late bool imageState;
  late String imageText;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = Message.message;
    imageState = Message.imageState;
    imageSet();
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
            "수정화면",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    imageText,
                  ),
                  Switch(
                    value: imageState,
                    onChanged: (value) {
                      setState(() {
                        imageState = value;
                        imageSet();
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Message.imageState = imageState;
                  Message.message = controller.text;
                  Navigator.pop(context);
                }, 
                child: const Text("Ok",),),
            ],
          ),
        ),
      ),
    );
  }

  // fucntions
  imageSet() {
    if (imageState) {
      imageText = "On";
    } else {
      imageText = "Off";
    }
  }
}
