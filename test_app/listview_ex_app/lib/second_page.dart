import 'package:flutter/material.dart';
import 'package:listview_ex_app/flag_item.dart';

class SecondPage extends StatefulWidget {
  final List<Flag> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  final nameController = TextEditingController();
  final nameController2 = TextEditingController();
  var _imagePath;
  String imageName = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {
                      if ( value.isNotEmpty) {
                        nameController2.text = "${value[0]}${" _ "*(value.length-1)}";
                      } else {
                        nameController2.text = "";
                      }
                    });
                  },
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    label: Text("정답을 입력하세요",),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: nameController2,
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    label: Text("문제 형식입니다.",),
                  ),
                  readOnly: true,
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/china.png";
                        setState(() {
                          imageName = "중국";
                        });
                      },
                      child: Image.asset(
                        "images/china.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/korea.png";
                        setState(() {
                          imageName = "대한민국";
                        });
                      },
                      child: Image.asset(
                        "images/korea.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/chille.png";
                        setState(() {
                          imageName = "칠레";
                        });
                      },
                      child: Image.asset(
                        "images/chille.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/spain.png";
                        setState(() {
                          imageName = "스페인";
                        });
                      },
                      child: Image.asset(
                        "images/spain.png",
                        width: 80,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _imagePath = "images/newzealand.png";
                        setState(() {
                          imageName = "뉴질랜드";
                        });
                      },
                      child: Image.asset(
                        "images/newzealand.png",
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                imageName,
              ),
              ElevatedButton(
                onPressed: () {
                  var nation = Flag(imagePath: _imagePath, nation: imageName);
                  showFlag(context, nation);
                },
                child: Text(
                  "문제 추가하기",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // fucntions
  showFlag(BuildContext context, var nation) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("문제 추가하기"),
          content: Text("이 국가의 문제는 ${nameController2.text}입니다. \n"
            "문제의 정답은 $imageName입니다."
            "이 문제를 추가하시겠습니까?"
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.list.add(nation);
                Navigator.of(ctx).pop();
              },
              child: const Text("예",),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("아니요", style: TextStyle(color: Colors.red,),),
            ),
          ],
        );
      },
    );
  }
  }

