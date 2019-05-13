import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_demo/model/main_model.dart';
import 'package:flutter_demo/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/page/auth_page.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() {
    return _MePageState();
  }
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Provide<MainModel>(
        builder: (context, child, model) {
          return model.isLogin ? _buildList() : Container(child: _buildRaisedButton(context),color: Colors.amber,);
        },
      ),
    );
  }

  RaisedButton _buildRaisedButton(BuildContext context) {
    return RaisedButton(
      child: Text("请登录"),
      onPressed: () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          LoginPage.sName,
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  Widget _buildList() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.person_pin),
          title: Text("已经登录"),
          onTap: () {},
          trailing: Icon(Icons.edit),
        ),
        Divider(
          color: Color(0xFFff0000),
        ),
        ListTile(
            onTap: () {},
            leading: Icon(Icons.language),
            title: Text("语言"),
            trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("zh"), Icon(Icons.navigate_next)],
              ),
            )),
        Divider(
          color: Color(0xFFff0000),
        ),
        ListTile(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return AuthPage();
              }));
            },
            leading: Icon(Icons.perm_identity),
            title: Text("身份认证"),
            trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[Text("身份认证"), Icon(Icons.navigate_next)],
              ),
            )),
      ],
    );
  }
}
