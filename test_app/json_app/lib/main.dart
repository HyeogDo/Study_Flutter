import 'dart:convert';

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
          "JSON Test",
        ),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text("데이터가 없습니다.")
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("Code :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text(
                                data[index]["code"],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("Name :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text(
                                data[index]["name"],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("Dept :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text(
                                data[index]["dept"],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text("Phone :",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              Text(
                                data[index]["phone"],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
      ),
    );
  }

  // functions
  Future<bool> getJSONData() async {
    var url = Uri.parse("http://localhost:8080/Flutter/student_query_flutter.jsp");
    // var url = Uri.parse("https://zeushahn.github.io/Test/student2.json");
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON["results"];
      data.addAll(result);      
    });

    // print(result[0]["code"]);
    // print(data[0]["name"]);
    return true;
  }
}
