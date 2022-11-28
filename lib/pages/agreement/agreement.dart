import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Agrenement extends StatefulWidget {
  const Agrenement({Key? key}) : super(key: key);

  @override
  State<Agrenement> createState() => _AgrenementState();
}

class _AgrenementState extends State<Agrenement> {
  late String title;
  late String url;

  @override
  void initState() {
    super.initState();

    title = Get.parameters['title'].toString();
    url = Get.parameters['url'].toString();

    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
