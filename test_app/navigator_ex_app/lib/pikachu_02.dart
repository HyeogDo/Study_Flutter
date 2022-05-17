

import 'package:flutter/material.dart';

class Pikachu02 extends StatelessWidget {
  const Pikachu02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Pikachu_02",
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/pikachu-1.jpg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/pikachu-2.jpg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/pikachu-3.jpg",
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}