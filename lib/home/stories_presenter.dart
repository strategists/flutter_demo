import 'package:flutter_demo/architecture/contract.dart';
import 'package:flutter_demo/model/result.dart';
import 'package:flutter_demo/entity/home_order_entity.dart';

abstract class StoriesPresenter implements IPresenter{
  loadNews(String date);
}


abstract class StoriesView implements IView<StoriesPresenter>{

  void onLoadNewsSuc(Result<HomeOrderResultData> entity);
  void onLoadNewsFail();

}
