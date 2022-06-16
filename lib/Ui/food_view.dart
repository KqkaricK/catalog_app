import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_app/Bloc/food_bloc.dart';
import 'package:catalog_app/Bloc/food_event.dart';
import 'package:catalog_app/Model/food_model.dart';
import 'package:catalog_app/Bloc/food_state.dart';
import 'package:catalog_app/Ui/new_page.dart';
import 'package:scrollable_list_tabview/scrollable_list_tabview.dart';

class FoodView extends StatefulWidget {
  @override
  _FoodViewState createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  FoodBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<FoodBloc>(context);
    bloc.add(GetFood());

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 234, 234),
      appBar: appBar(),
      body: foodList(context),
    );
  }

  appBar() {
    return AppBar(
      title: Text(
        "Меню",
      ),
    );
  }

  foodList(BuildContext context) {
    return BlocBuilder<FoodBloc, FoodState>(
      builder: (context, state) {
        if (state is FoodLoaded) {
          return ScrollableListTabView(
            tabHeight: 48,
            tabs: [
              ScrollableListTab(
                  tab: const ListTab(
                      label: Text('Блины'),
                      activeBackgroundColor: Colors.orangeAccent),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return productListitem(context, state.product[i]);
                    },
                  )),
              ScrollableListTab(
                  tab: const ListTab(
                      label: Text('Шаурма'),
                      activeBackgroundColor: Colors.orangeAccent),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return productListitem(context, state.product[i + 4]);
                    },
                  )),
              ScrollableListTab(
                  tab: const ListTab(
                      label: Text('Десерты'),
                      activeBackgroundColor: Colors.orangeAccent),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, i) {
                      return productListitem(context, state.product[i + 7]);
                    },
                  )),
              ScrollableListTab(
                  tab: const ListTab(
                      label: Text('Бутерброды'),
                      activeBackgroundColor: Colors.orangeAccent),
                  body: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 13,
                    itemBuilder: (context, i) {
                      return productListitem(context, state.product[i + 10]);
                    },
                  )),
            ],
          );
        }
        return Container();
      },
    );
  }

  productListitem(BuildContext context, Food product) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 7,
        margin: EdgeInsets.all(16),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPage(product.name, product.image,
                        product.price, product.disk)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  height: 75,
                  width: 100,
                  child: Image.asset(
                    "assets/images/${product.image}",
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0, right: 16),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                  "${product.disk}\nЦена: ${product.price} ₽",
                                  overflow: TextOverflow.fade,
                                  softWrap: false),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
