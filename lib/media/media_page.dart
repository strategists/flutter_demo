import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/gather_page.dart';
import 'package:flutter_demo/rtc/trtc_page.dart';

class MediaPage extends GatherPage {
  MediaPage() : super(content:MediaListBody(),title:"图像采集",targetPage:TrtcPage());
}

class MediaListBody extends StatefulWidget {
  @override
  _MediaListBodyState createState() {
    return _MediaListBodyState();
  }
}

class _MediaListBodyState extends State<MediaListBody> {
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
//      widget = ProgressDialog.buildProgressDialog();
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
      onTap: () {},
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
