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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int count;
  @override
  void initState() {
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Text("Count Up & Down",),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("현재 클릭수는 $count 입니다.",),
           const SizedBox(
             height: 50,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               FloatingActionButton(
                 onPressed: () {
                   setState(() {
                    count++;
                   });
                 },
                 child: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 30,
                ),
               FloatingActionButton(
                 onPressed: () {
                   setState(() {
                    if (count > 0) {
                      count--;
                    }
                   });
                 },
                 backgroundColor: Colors.red,
                 child: const Icon(Icons.remove,),
                 
                ),
             ],
           ),
         ],
       ),
     ),
   );
  }
}