import 'package:flutter/material.dart';
import 'package:flutter_demo/home_content.dart';


class HousePage extends StatefulWidget {
  @override
  _HousePageState createState() {
    return _HousePageState();
  }
}

class _HousePageState extends State<HousePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        textDirection: TextDirection.ltr,
        overflow: Overflow.visible,
        fit: StackFit.loose,
        children: <Widget>[
          Column(
//              mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.blue,
              ),
              Container(
                color: Colors.white,
              )
            ],
          ),
          Content()
        ],
      ),
    );
  }
}
