import 'package:flutter/material.dart';

class ScrollSliverPage extends StatefulWidget {
  @override
  _ScrollSliverPageState createState() {
    return _ScrollSliverPageState();
  }
}

class _ScrollSliverPageState extends State<ScrollSliverPage> {
  @override
  Widget build(BuildContext context) {
    return _buildCustomScrollView();
  }

  Widget _buildCustomScrollView() {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        _sliverFixedExtentList(),
      ],
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

  SliverFixedExtentList _sliverFixedExtentList() {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        },
      ),
    );
  }
}
