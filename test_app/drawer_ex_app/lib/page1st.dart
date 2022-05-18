

import 'package:flutter/material.dart';

class Page1st extends StatelessWidget {
  const Page1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Mail"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
          ),
          Text("send to yubi"),
          Text("send to kwanwoo"),
          Text("send to jangbi"),
        ],
      ),
    );
  }
}