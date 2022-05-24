import 'package:flutter/material.dart';
import 'package:listview_todo_ex_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool purchase, appointment, study;
  late String imagePath;

  @override
  void initState() {
    textEditingController = TextEditingController();
    purchase = true;
    appointment = false;
    study = false;
    imagePath = "";
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
            "Add View",
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "구매",
                    ),
                    Switch(
                      value: purchase,
                      onChanged: (value) {
                        setState(() {
                          changeSwitch(value);
                          purchase = value;
                          // if (purchase) {
                          //   study = false;
                          //   appointment = false;
                          //   imagePath = "images/cart.png";
                          // } else if (!purchase && !appointment && !study) {
                          //   purchase = true;
                          // }
                        });
                      },
                    ),
                    Image.asset(
                      "images/cart.png",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "약속",
                    ),
                    Switch(
                      value: appointment,
                      onChanged: (value) {
                        setState(() {
                          changeSwitch(value);
                          appointment = value;
                          // if (appointment) {
                          //   study = false;
                          //   purchase = false;
                          //   imagePath = "images/clock.png";
                          // } else if (!purchase && !appointment && !study) {
                          //   purchase = true;
                          // }
                        });
                      },
                    ),
                    Image.asset(
                      "images/clock.png",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "스터디",
                    ),
                    Switch(
                      value: study,
                      onChanged: (value) {
                        setState(() {
                          changeSwitch(value);
                          study = value;
                          // if (study) {
                          //   purchase = false;
                          //   appointment = false;
                          //   imagePath = "images/pencil.png";
                          // } else if (!purchase && !appointment && !study) {
                          //   purchase = true;
                          // }
                        });
                      },
                    ),
                    Image.asset(
                      "images/pencil.png",
                    ),
                  ],
                ),
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    labelText: "목록을 입력하세요",
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (textEditingController.text.trim().isNotEmpty) {
                      changeImagePath();
                      addList();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // functions
  addList() {
    Message.imagePath = imagePath;
    Message.workList = textEditingController.text;
    Message.action = true;

  }

  changeSwitch(bool value) {
    if(value) {
      study = false;
      appointment = false;
      purchase = false;
    } else{
      purchase = true;
    }
  }

  changeImagePath() {
    if (purchase) {
      imagePath = "images/cart.png";
    } else if(appointment) {
      imagePath = "images/clock.png";
    } else if (study) {
      imagePath = "images/pencil.png";
    }
  }
}
