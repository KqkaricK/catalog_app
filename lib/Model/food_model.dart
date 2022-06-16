import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Food extends Equatable {
  final String name;
  final int price;
  final String image;
  final String disk;
  Food({
    @required this.name,
    @required this.price,
    @required this.image,
    @required this.disk,
  });

  @override
  List<Object> get props => [
        name,
        price,
        image,
        disk,
      ];

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json["name"],
      price: json["price"],
      image: json["image"],
      disk: json["disk"],
    );
  }
}
