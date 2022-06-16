import 'package:equatable/equatable.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();
}

class GetFood extends FoodEvent {
  const GetFood();

  @override
  List<Object> get props => [];
}
