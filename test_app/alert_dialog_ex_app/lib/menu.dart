

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert and Push"),
      ),
      body: GestureDetector(
        child: const Center(
          child: Text("Move the 1st Page"),
        ),
        onTap: () => _showDialog(context),
      ),
    );
  }

    // -- Functions
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Page 이동"),
          content: const Text("아래의 버튼을 누르면 페이지 이동을 합니다."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.pushNamed(context, "page1st");
              },
              child: const Text("Page 이동"),
            ),
          ],
        );
      },
    );
  }
}