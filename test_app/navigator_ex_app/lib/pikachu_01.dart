

import 'package:flutter/material.dart';

class Pikachu01 extends StatelessWidget {
  const Pikachu01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 100, 0),
      appBar: AppBar(
        title: const Text(
          "Pikachu_01",
        ),
        backgroundColor: Colors.green,
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/pikachu-1.jpg"),
                radius: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/pikachu-2.jpg"),
                    radius: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/pikachu-3.jpg"),
                    radius: 50,
                  ),
                ),

              ],
            )


          ],
        ),
      ),
    );
  }
}