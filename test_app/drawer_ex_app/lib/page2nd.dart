

import 'package:flutter/material.dart';

class Page2nd extends StatelessWidget {
  const Page2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Received Mail"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text("mail from yubi"),
          Text("mail from kwanwoo"),
          Text("mail from yubi"),
        ],
      ),
    );
  }
}