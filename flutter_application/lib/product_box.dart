import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductBox extends StatelessWidget {
  final Product product;

  const ProductBox({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 150,
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/${product.image}"),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(product.name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(product.description),
                      Text("Rs : ${product.price}"),
                    ],
                  )),
            )
          ],
        )));
  }
}
