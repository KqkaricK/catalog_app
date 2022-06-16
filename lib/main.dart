import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_app/Bloc/food_bloc.dart';
import 'package:catalog_app/Ui/food_view.dart';
import 'package:catalog_app/Repository/food_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEEEEEE),
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.orange, secondary: Colors.orangeAccent)),
      home: BlocProvider(
        create: (context) => FoodBloc(
          FakeFoodRepository(),
        ),
        child: FoodView(),
      ),
    );
  }
}
