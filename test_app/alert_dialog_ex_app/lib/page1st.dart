

import 'package:flutter/material.dart';

class Page1st extends StatelessWidget {
  const Page1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          "2번째 페이지 입니다.",
        ),
      ),
    );
  }
}