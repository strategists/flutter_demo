import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:provide/provide.dart';

class MainModel with ChangeNotifier {
  bool isLogin = false;

  get() => isLogin;

  set(isLogin) {
    this.isLogin = isLogin;
    notifyListeners();
  }
}
