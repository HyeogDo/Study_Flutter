import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text(
          "영웅 Card",
        ),
        backgroundColor: const Color.fromARGB(255, 255, 100, 0),
      ),
      body: Column(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/Lee.jpg"),
                  radius: 50,
                ),
              ),
              const Divider(
                height: 3,
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "성웅",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "이순신 장군",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "전적",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 3,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "62전 62승",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      Icon(
                        Icons.check_circle_outline,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                      ),
                      Icon(
                        Icons.check_circle_outline,
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(3.2),
                        child: Text(
                          "옥포해전",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.2),
                        child: Text(
                          "사천포해전",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.2),
                        child: Text(
                          "당포해전",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.2),
                        child: Text(
                          "한산도대첩",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.2),
                        child: Text(
                          "부산포해전",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "명량해전",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.2),
                        child: Text(
                          "노량해전",
                          style: TextStyle(
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("images/turtle.gif"),
                backgroundColor: Colors.orange,
                radius: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
