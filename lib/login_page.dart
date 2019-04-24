import 'package:flutter/material.dart';
import 'home_page.dart';

const int x = 5;
const String sName = "Login";

class LoginPage extends StatefulWidget {
  final bool isLogin = false;
  static const int x = 5;
  static final String sName = "Login";

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _login() {
    Navigator.of(context).pushReplacementNamed(HomePage.sName);
  }

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[
      Padding(padding: EdgeInsets.all(48.0)),
      Text(
        "手机快捷登录",
        maxLines: 1,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
//            textScaleFactor: 1.5,
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.lightBlue, fontSize: 24, fontFamily: "Courier"),
      ),
      Text("免注册登录",
          maxLines: 1,
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
//            textScaleFactor: 1.0,
          textDirection: TextDirection.ltr,
          style: TextStyle(
//              background: new Paint()..color = Colors.amberAccent,
              color: Colors.lightBlue,
              fontSize: 12)),
      Padding(padding: EdgeInsets.all(38.0)),
      TextField(
        autofocus: true,
        maxLengthEnforced: true,
        decoration: InputDecoration(labelText: "请输入手机号"),
      ),
      TextField(
        autofocus: true,
        maxLengthEnforced: true,
        decoration: InputDecoration(labelText: "请输入验证码"),
      ),
      Padding(
        padding: EdgeInsets.all(20),
      ),
      SizedBox(
        width: 343,
        height: 47,
        child: RaisedButton(
          child: Text("登录"),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 4.0,
          onPressed: () => this._login(),
        ),
      )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar:AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: list,
            ),
          ),
        ),
      ),
    );
  }
}
