import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late List data;
  Random random = Random();
  


  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JSON Movie",
        ),
      ),
      body: Center(
        child: data.isEmpty ? const CircularProgressIndicator() : ListView.builder(
          itemCount: data.length ~/ 3,
          itemBuilder: (context, index) {
            return random.nextBool() ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: SizedBox(
                          height: 110,
                          width: 200,
                          child: Card(
                            color: Color.fromARGB(random.nextInt(250), random.nextInt(250), random.nextInt(250), random.nextInt(250)) ,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(data[index*3]["image"],width: 100, height: 100,),
                                    Text(data[index*3]["title"],),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        width: 200,
                        child: Card(
                          color: Color.fromARGB(random.nextInt(250), random.nextInt(250), random.nextInt(250), random.nextInt(250)) ,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(data[index*3+1]["image"],width: 100, height: 100,),
                                  Text(data[index*3+1]["title"],),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 220,
                    width: 200,
                    child: Card(
                      color: Color.fromARGB(random.nextInt(250), random.nextInt(250), random.nextInt(250), random.nextInt(250)) ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.network(data[index*3+2]["image"],width: 100, height: 100,),
                              Text(data[index*3+2]["title"],),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ) :  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 220,
                    width: 200,
                    child: Card(
                      color: Color.fromARGB(random.nextInt(250), random.nextInt(250), random.nextInt(250), random.nextInt(250)) ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.network(data[index*3+2]["image"],width: 100, height: 100,),
                              Text(data[index*3+2]["title"],),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 110,
                        width: 200,
                        child: Card(
                          color: Color.fromARGB(random.nextInt(250), random.nextInt(250), random.nextInt(250), random.nextInt(250)) ,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(data[index*3]["image"],width: 100, height: 100,),
                                  Text(data[index*3]["title"],),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        width: 200,
                        child: Card(
                          color: Color.fromARGB(random.nextInt(250), random.nextInt(250), random.nextInt(250), random.nextInt(250)) ,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(data[index*3+1]["image"],width: 100, height: 100,),
                                  Text(data[index*3+1]["title"],),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                ],
              ),
            );

          },),
      ),
    );
  }

  // functions
  Future<bool> getJSONData() async {
    var url = Uri.parse("https://zeushahn.github.io/Test/movies.json");
    var response = await http.get(url);

  setState(() {
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON["results"];
    data.addAll(result);
  });
  return true;
  }
}