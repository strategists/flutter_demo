import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/common_loading_dialog.dart';
import 'package:flutter_demo/form/form_page.dart';

class Multiterm extends StatefulWidget {
  @override
  _MultitermState createState() {
    return _MultitermState();
  }
}

class _MultitermState extends State<Multiterm> {
  var _list = <String>[];

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    for (var i = 0; i < 120; i++) {
      _list.add("QREWFWEFF");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildList(context);
  }

  Widget _buildList(BuildContext context) {
//    assert(_list = null);
    var widget;
    if (_list == null || _list.isEmpty) {
      widget = ProgressDialog.buildProgressDialog();
    } else {
      widget = new ListView.builder(
        //设置physics属性总是可滚动
        physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: _buildItem,
      );
    }

    return widget;
  }

  Widget _buildItem(BuildContext context, int index) {
    String text = _list[index];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          new PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (context, animation, secondaryAnimation) {
              return new FadeTransition(
                //使用渐隐渐入过渡,
                opacity: animation,
                child: FormPage(),
              );
            },
          ),
        );
      },
      child: _buildCard(),
    );
  }

  Card _buildCard() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        elevation: 2.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "重庆中链融",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "下户中",
                      style: TextStyle(color: Colors.amber, fontSize: 12.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "客户经理【张三】，邀您进行远程下户",
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.home),
                  Text(
                    "光电园",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
