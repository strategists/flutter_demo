import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController telController = new TextEditingController();
  TextEditingController authCodeController = new TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _read();
  }

  void _write() async {
    var mobile = telController.text.trim();
    var authCode = authCodeController.text.trim();
    if (mobile.isNotEmpty && authCode.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('mobile_num', mobile);
      await prefs.setString('auth_code', authCode);
    }
  }

  void _read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheMobile =  prefs.getString('mobile_num');
    telController.text = cacheMobile;
  }

  void _login() {
    _write();
    Navigator.of(context).pushReplacementNamed(HomePage.sName);
  }

  bool mobileOk() {
    String telRegex = "^((1[3,5,7,8][0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}";
    telController.text.allMatches(telRegex);
    return telController.text.trim().isNotEmpty;
  }

  bool authCodeOk() {
    String telRegex = "^((1[3,5,7,8][0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}";
    return authCodeController.text.trim().isNotEmpty;
  }

  Widget _builder() {
    return new Builder(builder: (BuildContext context) {
      return RaisedButton(
        child: Text("登录"),
        color: Colors.blue,
        textColor: Colors.white,
        elevation: 4.0,
//        onPressed: () => this._login(),
        onPressed: () {
          if (!mobileOk()) {
            showSnackBar(context, '请输入手机号');
          } else if (!authCodeOk()) {
            showSnackBar(context, '请输入验证码');
          } else {
            _login();
          }
        },
      );
    });
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = new SnackBar(
      content: new Text(text),
    );
    Scaffold.of(context).showSnackBar(snackBar);
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
      Text(
        "免注册登录",
        maxLines: 1,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
//            textScaleFactor: 1.0,
        textDirection: TextDirection.ltr,
        style: TextStyle(
//              background: new Paint()..color = Colors.amberAccent,
            color: Colors.lightBlue,
            fontSize: 12),
      ),
      Padding(padding: EdgeInsets.all(38.0)),
      TextField(
        keyboardType: TextInputType.phone,
        controller: telController,
        autofocus: true,
        maxLengthEnforced: true,
        maxLength: 11,
        decoration: InputDecoration(labelText: "请输入手机号"),
      ),
      TextField(
        keyboardType: TextInputType.number,
        controller: authCodeController,
        autofocus: true,
        maxLengthEnforced: true,
        maxLength: 6,
        decoration: InputDecoration(labelText: "请输入验证码"),
      ),
      Padding(
        padding: EdgeInsets.all(20),
      ),
      SizedBox(
        width: 343,
        height: 47,
        child: _builder(),
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
