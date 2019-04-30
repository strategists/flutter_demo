import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_demo/media/media_page.dart';
import 'package:flutter_demo/widget/gather_page.dart';
import 'package:flutter_demo/rtc/trtc_page.dart';

class FormPage extends StatefulWidget {
  static final String sName = "FormPage";

  @override
  _FormPageState createState() {
    return _FormPageState();
  }
}

class _FormPageState extends State<FormPage> {
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  MethodChannel _methodChannel =
      new MethodChannel("samples.flutter.io/device_info");

  void _getBatteryLevel() async {
    String batteryLevel;
    try {
      var battery = await _methodChannel.invokeMethod("getBatteryLevel");
      batteryLevel = 'Battery level at $battery % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("信息填写"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var stack = Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text("电池电量：$_batteryLevel"),
            RaisedButton(
              onPressed: () {
                _getBatteryLevel();
              },
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBottomCard(),
        )
      ],
    );
    return SafeArea(
      child: Container(
        color: const Color(0xFFF5F5F5),
        child: stack,
      ),
    );
  }

  DecoratedBox _buildDecoratedBox() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0),
      ]),
      child: SizedBox(
        width: 282,
        height: 44,
        child: _buildRaisedButton(),
      ),
    );
  }

  Widget _buildBottomCard() {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(color: Colors.white, boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black12, offset: Offset(1.0, 1.0), blurRadius: 2.0),
      ]),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: double.infinity, //宽度尽可能大
            minHeight: 56.0, //最小高度为56像素
            maxHeight: 56.0),
        child: Center(
          child: _buildDecoratedBox(),
        ),
      ),
    );
  }

  RaisedButton _buildRaisedButton() {
    return RaisedButton(
      color: const Color(0xFF5588FD),
      onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => MediaPage()),
        );
      },
      textColor: Colors.white,
      child: Text("提交"),
    );
  }
}
