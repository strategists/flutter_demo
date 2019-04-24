import 'package:flutter/material.dart';

class EmptyPage extends StatefulWidget {
  @override
  _EmptyPageState createState() {
    return _EmptyPageState();
  }
}

class _EmptyPageState extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var emptyImage = Image(
      image: AssetImage("images/pic_empty.png"),
      width: 100,
      height: 100,
    );
    return Center(
      widthFactor: 50,
      heightFactor: 50,
      child: emptyImage,
    );
  }
}
