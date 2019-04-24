import 'package:flutter/material.dart';

class GatherPage extends StatefulWidget {
  final String title;
  final String buttonText;
  final Widget content;
  final bool showFooter;
  final Widget targetPage;
  final bool clearStack;

  const GatherPage({
    Key key,
    @required this.content,
    this.title,
    this.buttonText = "提交",
    this.showFooter = true,
    this.targetPage,
    this.clearStack = false,
  })  : assert(title != null),
        assert(content != null),
        super(key: key);

  @override
  _GatherPageState createState() {
    return _GatherPageState();
  }
}

class _GatherPageState extends State<GatherPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    var children = <Widget>[];
    children.add(widget.content);
    if (widget.showFooter) {
      children.add(Align(
        alignment: Alignment.bottomCenter,
        child: _buildBottomCard(),
      ));
    }
    return SafeArea(
      child: Container(
        color: const Color(0xFFF5F5F5),
        child: Stack(
          children: children,
        ),
      ),
    );
  }

  ///
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
        if (widget.clearStack) {
          Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(builder: (context) => widget.targetPage),
            (Route<dynamic> route) => false,
          );
        } else {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => widget.targetPage));
        }
      },
      textColor: Colors.white,
      child: Text(widget.buttonText),
    );
  }
}
