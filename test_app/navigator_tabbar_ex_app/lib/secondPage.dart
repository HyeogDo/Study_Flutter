import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_item.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;
  String imageName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text(
                  "곤충",
                ),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text(
                  "영장류",
                ),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: _radioChange,
                ),
                const Text(
                  "포유류",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "날 수 있나요?",
                ),
                Checkbox(
                  value: flyExist,
                  onChanged: (check) {
                    setState(() {
                      flyExist = check!;
                    });
                  },
                )
              ],
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/cow.png";
                      setState(() {
                        imageName = "젖소";
                      });
                    },
                    child: Image.asset(
                      "images/cow.png",
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/pig.png";
                      setState(() {
                        imageName = "돼지";
                      });
                    },
                    child: Image.asset(
                      "images/pig.png",
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/bee.png";
                      setState(() {
                        imageName = "벌";
                      });
                    },
                    child: Image.asset(
                      "images/bee.png",
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/cat.png";
                      setState(() {
                        imageName = "고양이";
                      });
                    },
                    child: Image.asset(
                      "images/cat.png",
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/fox.png";
                      setState(() {
                        imageName = "여우";
                      });
                    },
                    child: Image.asset(
                      "images/fox.png",
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/monkey.png";
                      setState(() {
                        imageName = "원숭이";
                      });
                    },
                    child: Image.asset(
                      "images/monkey.png",
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                imageName,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                var animal = Animal(
                  animalName: nameController.text,
                  kind: getKind(_radioValue),
                  imagePath: _imagePath,
                  flyExist: flyExist,
                );

                AlertDialog dialog = AlertDialog(
                  title: Text("동물 추가하기"),
                  content: Text(
                    "이 동물은 ${animal.animalName} 입니다.\n"
                    "또 동물의 종은 ${animal.kind} 입니다.\n"
                    "이 동물은 ${animal.flyExist ? "날수 있습니다." : "날 수 없습니다."} \n"
                    "이 동물을 추가하시겠습니까?",
                    style: const TextStyle(fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        widget.list.add(animal);
                        Navigator.of(context).pop();
                      },
                      child: const Text("예"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "아니오",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                );
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return dialog;
                  },);
              },
              child: const Text(
                "동물 추가하기",
              ),
            ),
          ],
        ),
      ),
    );
  }

  // functions
  _radioChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "곤충";
      case 1:
        return "영장류";
      case 2:
        return "포유류";
    }
  }
}
