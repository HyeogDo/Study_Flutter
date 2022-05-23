

import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/firstPage.dart';
import 'package:tabbar_image_ex_app/secondPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
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
          "이미지 변경하기"
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          SecondPage(),
        ],
        ),
        bottomNavigationBar: Container(
          color: Colors.green,
          child: TabBar(
            controller: controller,
            labelColor: Colors.black,
            indicatorColor: Colors.yellow,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.cake_outlined,
                  color: Colors.black,
                ),
                text: "Buttons",
              ),
              Tab(
                icon: Icon(
                  Icons.tv,
                  color: Colors.red,
                ),
                text: "Swipe",
              ),
            ],),
        ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {

              }, 
              child: const Text("1111111"),
            ),
            TextButton(
              onPressed: () {
                
              }, 
              child: const Text("222222"),
            ),
          ],
        ),
      ),
    );
  }
}