import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  @override
  State createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
//    Navigator.of(context).pushAndRemoveUntil(
//        new MaterialPageRoute(builder: (context) => LoginPage()),
//        (route) => route == null);

    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 2),(){
      _getHasSkip();
    });
  }

  void _getHasSkip(){
    Navigator.of(context).pushReplacementNamed(LoginPage.sName);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
