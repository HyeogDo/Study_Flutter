
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeletePage extends StatefulWidget {
  final String scode;
  const DeletePage({Key? key, required this.scode}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {

  // Property
  final codeController = TextEditingController();

  late String result;
  late String code;

  @override
  void initState() {
    code = "";
    result = "";
    codeController.text = widget.scode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title : const Text('Insert & return for CRUD'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: codeController,
                  decoration: const InputDecoration(
                    labelText: '삭제할 학번을 입력하세요',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                      )
                    ),
                  ),
                  
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    code = codeController.text;
                    deleteAction(context);
                  },
                  child: const Text('입력')
                ),
              ],
            ),
          ),
        ),
        
      ),
    );
  }

  // --- functions
  Future<bool> deleteAction(BuildContext context) async{
    
    var url = Uri.parse(
      'http://localhost:8080/Flutter/student_delete_return_flutter.jsp?code=$code'
    );

    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));

      result = dataConvertedJSON["result"];

      if(result == "OK"){
        _showDialog(context);

      }else if(result == "ERROR"){
        errorSnackBar(context);
      }
    });
    
    return true;
  }

  // -- functions

  _showDialog(BuildContext context){
    showDialog(context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title:  const Text('결과'),
        content: const Text('삭제가 완료 되었습니다.'),
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).pop();
              Navigator.pop(context);
            }, 
            child: const Text('OK'),
          )
        ],
      );
    }
    );
  }

  errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('입력 에러가 발생했습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      )
    );
  }
  }
