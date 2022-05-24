import 'package:flutter/material.dart';
import 'package:listview_ex_app/first_page.dart';
import 'package:listview_ex_app/flag_item.dart';
import 'package:listview_ex_app/second_page.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;
  List<Flag> flagList = [];

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);

    flagList.add(
      Flag(imagePath: "images/austria.png", nation: "오스트리아"),
    );
    flagList.add(
      Flag(imagePath: "images/belgium.png", nation: "벨기에"),
    );
    flagList.add(
      Flag(imagePath: "images/estonia.png", nation: "에스토니아"),
    );
    flagList.add(
      Flag(imagePath: "images/france.png", nation: "프랑스"),
    );
    flagList.add(
      Flag(imagePath: "images/germany.png", nation: "독일"),
    );
    flagList.add(
      Flag(imagePath: "images/hungary.png", nation: "헝가리"),
    );
    flagList.add(
      Flag(imagePath: "images/italy.png", nation: "이탈리아"),
    );
    flagList.add(
      Flag(imagePath: "images/latvia.png", nation: "라트비아"),
    );
    flagList.add(
      Flag(imagePath: "images/lithuania.png", nation: "리투아니아"),
    );
    flagList.add(
      Flag(imagePath: "images/luxemburg.png", nation: "룩셈부르크"),
    );
    flagList.add(
      Flag(imagePath: "images/netherland.png", nation: "네덜란드"),
    );
    flagList.add(
      Flag(imagePath: "images/romania.png", nation: "루마니아"),
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
          "국가명 맞추기",
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: flagList),
          SecondPage(list: flagList),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
        height: 70,
        child: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.flag,
                color: Colors.blue,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.flag_circle,
                color: Colors.red,
              ),
            ),
          ],
          ),
      ),
    );
  }
}
