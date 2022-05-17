

import 'package:flutter/material.dart';
import 'package:navigator_ex_app/pikachu_01.dart';
import 'package:navigator_ex_app/pikachu_02.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Menu Page",
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Pikachu01(),));
              }, 
              child: const Text(
                "Pikachu-01"
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Pikachu02(),));
              }, 
              child: const Text(
                "Pikachu-02"
              ),
            ),
          ],
        ),
      ),
    );
  }
}