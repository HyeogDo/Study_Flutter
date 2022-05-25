import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/animal_item.dart';

class FirstPage extends StatefulWidget {
  final List<Animal> list;
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
                showKind(context,position);
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
                    Text("      ${widget.list[position].animalName}",),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // functions
  showKind(BuildContext context,int position) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.list[position].animalName),
          content:  Text("이 동물은 ${widget.list[position].kind}입니다."),
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
