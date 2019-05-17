import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrollFoldPage extends StatefulWidget {
  @override
  _ScrollFoldPageState createState() {
    return _ScrollFoldPageState();
  }
}

class _ScrollFoldPageState extends State<ScrollFoldPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light));
    return _buildNestedScrollView();
  }

  Widget _buildNestedScrollView() {
    return NestedScrollView(
      physics: NeverScrollableScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        debugPrint("innerBoxIsScrolled: $innerBoxIsScrolled");
        return <Widget>[
          _buildSliverAppBar(),
        ];
      },
      body: Container(
        color: Colors.white,
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      brightness: Brightness.light,
      //展开高度
      expandedHeight: 150.0,
//            title: Text("中链融"),
      centerTitle: true,
      //是否随着滑动隐藏标题
      floating: false,
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black,
        ),
      ),
      //是否固定在顶部
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      //可折叠的应用栏
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: true,
        title: Text(
          '中链融',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        background: Image.asset(
          "images/fold_head.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  SliverToBoxAdapter _sliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        child: Image.asset(
          "images/fold_head.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
