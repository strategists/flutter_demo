import 'package:flutter/material.dart';
import 'package:flutter_demo/scroll/scroll.dart';
import 'package:flutter_demo/image_picker/gallery.dart';
import 'package:flutter_demo/image_picker/photo_view.dart';
import 'package:flutter_demo/image_picker/multi_image_page.dart';

class ReceivablePage extends StatefulWidget {
  @override
  _ReceivablePageState createState() {
    return _ReceivablePageState();
  }
}

class _ReceivablePageState extends State<ReceivablePage> {
  List<Map<String, dynamic>> _items = [];
  List<Widget> _page = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map<String, dynamic> map = {
      "title": "滚动监听",
      "page": ScrollListenPage(),
    };
    _items.add(map);
    _items.add(<String, dynamic>{
      "title": "滚动监听",
      "page": ScrollListenPage(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListBody(
            children: <Widget>[
              _buildItem("滚动监听", ScrollListenPage()),
              _buildItem("滚动通知", ScrollNotificationTestRoute()),
              _buildItem("滚动联动", ScrollFoldPage()),
              _buildItem("折叠滚动", ScrollSliverPage()),
              _buildItem("折叠Tab滚动", SliverTabPage()),
              _buildItem("图片查看", PhotoView()),
              _buildItem("多图选择", MultiImagePage()),
            ],
          );
        },
        itemCount: 6,
      ),
    );
  }

  Widget _buildItem(String title, Widget page) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return page;
          }),
        );
      },
      leading: Icon(Icons.done),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
