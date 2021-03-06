import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart' as FlutterToast;
import 'home_content.dart';
import 'login_page.dart';
import 'package:flutter_demo/page/house_page.dart';
import 'package:flutter_demo/page/me_page.dart';
import 'package:flutter_demo/page/receivable_page.dart';
import 'package:flutter_demo/widget/toast.dart';
import 'package:provide/provide.dart';
import 'package:flutter_demo/model/main_model.dart';
import 'package:image_picker/image_picker.dart';

const String sName = "HomePage";

class HomePage extends StatefulWidget {
  static final String sName = "HomePage";

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<HomePage> with SingleTickerProviderStateMixin {
  Animation<double> tween;
  AnimationController _controller;
  PageController _pageController;

  int _currentIndex = 0;
  String _title = "远程下户";

  @override
  void initState() {
    super.initState();
    /*创建动画控制类对象*/
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    /*创建补间对象*/
    tween = new Tween(begin: 0.0, end: 1.0).animate(_controller) //返回Animation对象
      ..addListener(() {
        //添加监听
        setState(() {
//          print(tween.value); //打印补间插值
        });
      });
    _controller.forward(); //执行动画
    _pageController = new PageController();
  }

  void _onRefresh() {
    print("debug");
    /* Fluttertoast.showToast(
        msg: "刷新数据",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black);*/
    Toast.show("刷新成功", context, type: Toast.SUCCESS);
  }

  void _onLogout() {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(title: new Text("退出登录"),
//                content: new Text("This is my content"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("确认"),
                    onPressed: () {
                      /*Navigator.of(context).pushNamedAndRemoveUntil(
                    LoginPage.sName,
                        (Route<dynamic> route) => false,
                  );*/
                      Provide.value<MainModel>(context).set(false);
                      Navigator.of(context).pop();
                    },
                  )
                ]));
  }

  void _startAnim() {
    setState(() {
      _controller.forward(from: 0.0);
    });
  }

  @override
  void dispose() {
    super.dispose();
    //销毁控制器对象
    _controller.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _onLogout)
        ],
        centerTitle: true,
        title: Text(_title),
        leading: IconButton(icon: Icon(Icons.refresh), onPressed: _onRefresh),
      ),
      body: _buildBody(),
      drawer: SafeArea(
        child: Container(
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return PageView(
      children: <Widget>[HousePage(), ReceivablePage(), MePage()],
      controller: _pageController,
      onPageChanged: (index) => setState(() {
            _currentIndex = index;
          }),
      physics: NeverScrollableScrollPhysics(),
    );
    Widget widget;
    if (_currentIndex == 0) {
      return HousePage();
    } else if (_currentIndex == 1) {
      return MePage();
    } else if (_currentIndex == 2) {
      return ReceivablePage();
    }
    return widget;
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    var barItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.my_location),
          title: Text("远程下户")),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.monetization_on),
          icon: Icon(Icons.money_off),
          title: Text("应收通")),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.adjust),
          icon: Icon(Icons.account_circle),
          title: Text("我的")),
    ];
    return BottomNavigationBar(
      onTap: (i) => _pageController.jumpToPage(i),
      currentIndex: _currentIndex,
      items: barItems,
    );
  }
}
