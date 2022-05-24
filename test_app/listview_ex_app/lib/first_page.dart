

import 'package:flutter/material.dart';
import 'package:listview_ex_app/flag_item.dart';

class FirstPage extends StatefulWidget {
  final List<Flag> list;
  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, position) {
            return GestureDetector(
              onTap: () {
                showNation(context,position);
              },
              child: Card(
                child: Row(
                  children: [
                    Image.asset(
                      widget.list[position].imagePath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    Text("   ${widget.list[position].nation[0]}${" _ "*(widget.list[position].nation.length-1)}"),
                    
                  ],
                ),
              ),
            );
          }),
      ),
    );
  }

  // Functions
  showNation(BuildContext context, int position) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("국가명"),
          content:  Text("이 국기는 ${widget.list[position].nation}의 국기 입니다."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("종료"),
            ),
          ],
        );
      },
    );
  }
}