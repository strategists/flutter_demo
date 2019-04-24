import 'package:flutter_demo/entity/home_order_entity.dart';
import 'package:flutter_demo/entity/persion_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomeOrderResultEntity") {
      return HomeOrderResultEntity.fromJson(json) as T;
    } else if (T.toString() == "PersonEntity") {
      return PersonEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}