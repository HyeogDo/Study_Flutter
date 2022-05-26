import 'package:flutter/material.dart';
import 'package:webview_tabbar_app/webPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  // Property
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
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
      body: TabBarView(
        controller: controller,
        children: const [
          WebPage(
            siteName: "www.naver.com",
          ),
          WebPage(
            siteName: 'www.google.com',
          ),
          WebPage(siteName: "www.daum.net"),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.red,
          tabs:  [
            Tab(
              icon: Image.asset("images/naver.png", width: 40,),
              text: "Naver",
            ),
            Tab(
              icon: Image.asset("images/google.jpeg", width: 40,),
              text: "Google",
            ),
            Tab(
              icon: Image.asset("images/daum.jpeg",width: 40,),
              text: "Daum",
            ),

          ],
        ),
      ),
    );
  }
}
