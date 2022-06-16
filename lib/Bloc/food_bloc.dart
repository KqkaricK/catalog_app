import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_app/Bloc/food_event.dart';
import 'package:catalog_app/Repository/food_repository.dart';
import 'package:catalog_app/Bloc/food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodRepository repository;
  FoodBloc(this.repository) : super(null);

  Stream<FoodState> mapEventToState(FoodEvent event) async* {
    try {
      if (event is GetFood) {
        final product = await repository.retriveProduct();
        yield FoodLoaded(product);
      }
    } catch (error) {
      print("Error: " + error.toString());
    }
  }
}
