import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  final String siteName;
  const WebPage({Key? key, required this.siteName}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("WebView - Tabbar")
        ),

      
      body: Stack(
        children: [
          WebView(
            initialUrl: "https://${widget.siteName}",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    onPressed: () {
                      controller.data!.goBack();
                    },
                    child: const Icon(Icons.arrow_back),
                  );
            }
            return Stack();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }



}