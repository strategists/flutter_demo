import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/gather_page.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class TrtcPage extends GatherPage {
  TrtcPage()
      : super(
          content: Inside(),
          title: "视频通话",
          showFooter:false,
          clearStack: true,
          targetPage: HomePage(),
        );
}

class Inside extends StatefulWidget {
  @override
  _InsideState createState() {
    return _InsideState();
  }
}

class _InsideState extends State<Inside> {
  Future<void> _launched;
  String _phone = '';

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.airport_shuttle),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
        ),
        Text("资料提交成功"),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
        ),
        Text("稍后银行将会给您发起线上视频对话，请耐心等待"),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.person),
            Text("客户经理：张三"),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
        ),
        OutlineButton(
          onPressed: () {
            setState(() {
              _launched = _makePhoneCall('tel:$_phone');
            });
          },
          child: Text("联系Ta，加急处理"),
          color: Colors.white,
          textColor: const Color(0XFF5588FD),
          borderSide: BorderSide(
            color: const Color(0XFF5588FD),
          ),
        ),
        OutlineButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              new MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          },
          child: Text("返回主页"),
          color: Colors.white,
          textColor: const Color(0XFF5588FD),
          borderSide: BorderSide(
            color: const Color(0XFF5588FD),
          ),
        ),
      ],
    );
  }
}
