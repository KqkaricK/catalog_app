import 'package:catalog_app/Model/food_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

abstract class FoodRepository {
  Future<List<Food>> retriveProduct();
}

class FakeFoodRepository implements FoodRepository {
  @override
  Future<List<Food>> retriveProduct() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    var jsonObject = json.decode(jsonString);

    List<Food> list = List<Food>.from(
      jsonObject.map((i) => Food.fromJson(i)),
    );

    return list;
  }
}
