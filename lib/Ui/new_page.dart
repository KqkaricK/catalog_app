import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage(this.name, this.image, this.price, this.disk);

  final String image;
  final String name;
  final int price;
  final String disk;
  SizedBox space(double index) {
    return SizedBox(
      height: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Назад"),
        ),
        body: Stack(
          children: [
            ListView(padding: const EdgeInsets.all(16), children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                    child: Image.asset("assets/images/${image}",
                        fit: BoxFit.cover)),
              ),
              space(8),
              Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 26),
                  )),
              space(8),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    disk,
                  )),
              space(80),
            ]),
            Positioned(
                bottom: 8,
                left: 16,
                width: MediaQuery.of(context).size.width - 32,
                child: Card(
                  child: Container(
                      height: 80,
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Цена: $price ₽",
                          style: const TextStyle(
                              fontSize: 26, color: Colors.deepOrangeAccent),
                        ),
                      )),
                )),
          ],
        ));
  }
}
