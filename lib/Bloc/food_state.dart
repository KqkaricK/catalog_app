import 'package:equatable/equatable.dart';
import 'package:catalog_app/Model/food_model.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodLoaded extends FoodState {
  final List<Food> product;
  const FoodLoaded(this.product);

  @override
  List<Object> get props => [product];
}
