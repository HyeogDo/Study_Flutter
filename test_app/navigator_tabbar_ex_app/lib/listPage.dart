

import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_item.dart';
import 'package:navigator_tabbar_ex_app/firstPage.dart';
import 'package:navigator_tabbar_ex_app/secondPage.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with SingleTickerProviderStateMixin{
  // Property
  late TabController controller;
  late String tabText, tabText2;
  List<Animal> animalList = [];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    tabText = "";
    tabText2 = "";

    animalList.add(
      Animal(
        animalName: "벌",
        kind: "곤충",
        imagePath: "images/bee.png",
        flyExist: true,
      ),
    );
    animalList.add(
      Animal(
        animalName: "고양이",
        kind: "포유류",
        imagePath: "images/cat.png",
        flyExist: false,
      ),
    );
    animalList.add(
      Animal(
        animalName: "젖소",
        kind: "포유류",
        imagePath: "images/cow.png",
        flyExist: false,
      ),
    );
    animalList.add(
      Animal(
        animalName: "강아지",
        kind: "포유류",
        imagePath: "images/dog.png",
        flyExist: false,
      ),
    );
    animalList.add(
      Animal(
        animalName: "여우",
        kind: "포유류",
        imagePath: "images/fox.png",
        flyExist: false,
      ),
    );
    animalList.add(
      Animal(
        animalName: "원숭이",
        kind: "영장류",
        imagePath: "images/monkey.png",
        flyExist: false,
      ),
    );
    animalList.add(
      Animal(
        animalName: "돼지",
        kind: "포유류",
        imagePath: "images/pig.png",
        flyExist: false,
      ),
    );
    animalList.add(
      Animal(
        animalName: "늑대",
        kind: "포유류",
        imagePath: "images/wolf.png",
        flyExist: false,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "동물 친구 찾기",
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.purple,
        height: 70,
        child: TabBar(
          controller: controller,
          tabs:  [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
              text: tabText,
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.red,
              ),
              text: tabText2,
            ),
          ],
        ),
      ),
    );
  }

}