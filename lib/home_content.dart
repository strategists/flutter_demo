import 'package:flutter/material.dart';
import 'home/empty.dart';
import 'home/multiterm.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:core';
import 'repository/http_utils.dart';

class Content extends StatefulWidget {
  @override
  _ContentState createState() {
    return _ContentState();
  }
}

class _ContentState extends State<Content> {
  get() async {
    var httpClient = new HttpClient();
    var uri = new Uri.https(
      'https://zjyr.zhonglr.com',
      'remotedd/order/findOrder.json',
    );
    HttpClientRequest request = await httpClient.getUrl(uri);
    print(request.method);
    request.headers.add("mockSessionId", "193588298613252");
    print(request.headers);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    print(responseBody);
  }

  @override
  void initState()  {
    super.initState();
//    var response = await Http().get("/remotedd/order/findOrder.json");
//    print(response);
  }

  @override
  void didUpdateWidget(Content oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Multiterm();
  }
}
