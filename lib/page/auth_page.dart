import 'package:flutter/material.dart';
import 'dart:async';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("身份认证"),
        centerTitle: true,
      ),
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(),
      ),
    );
  }
}
