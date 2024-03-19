// import 'package:flutter/material.dart';
// //import 'package:flutter_application_1/product_box.dart';
// //import 'package:roll_dice_app/product_box.dart';
// import 'Product_box.dart';
// class ProductHomePage extends StatelessWidget {
//   const ProductHomePage({super.key});     
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Product Listing!')),
//       body: ListView(
//         shrinkWrap: true,
//         children: const [
//                ProductBox(
//                   name: "iPhone",
//                   description: "iPhone is the stylist phone ever",
//                   price: 1000,
//                   image: "iphone.jpg"
//                ),
//                ProductBox(
//                   name: "Pixel",
//                   description: "Pixel is the most featureful phone ever",
//                   price: 800,
//                   image: "pixel.jpg"
//                ),
//                ProductBox(
//                   name: "Laptop",
//                   description: "Laptop is most productive development tool",
//                   price: 2000,
//                   image: "laptop.jpg"
//                ),
//                ProductBox(
// name: "Tablet",
// description: "Tablet is the most useful device ever for meeting",
// price: 1500,
// image: "tablet.jpg"
//                ),
//                ProductBox(
//                   name: "Pendrive",
//                   description: "Pendrive is useful storage medium",
//                   price: 100,
//                   image: "pendrive.jpg"
//                ),
//                ProductBox(
//                   name: "Floppy Drive",
//                   description: "Floppy drive is useful rescue storage medium",
//                   price: 20,
//                   image: "floppydisk.jpg"
//                ),
//             ],
//       )
//     );
//  }
// }

//Version-2:

import 'package:flutter/material.dart';
import 'package:flutter_application/product_box.dart';
import 'package:flutter_application/models/product.dart';
import 'package:flutter_application/data/products.dart';

class ProductHomePage extends StatelessWidget {
  ProductHomePage({super.key});

  final products = items;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Message'),
              content: const Text('Just to say Hi!'),
              actions: [
                TextButton(
                    onPressed: () {
                      // Navigation

                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product Listing!')),

        // body: ListView(

        //   shrinkWrap: true,

        //   children: [

        //     ProductBox(item: products[0]),

        //     ProductBox(item: products[1]),

        //     ProductBox(item: products[2]),

        //     ProductBox(item: products[3]),

        //     ProductBox(item: products[4]),

        //     ProductBox(item: products[5]),

        //   ],

        // ),

        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              // return Container(

              //   padding: const EdgeInsets.all(5),

              //   child:ProductBox(item:products[index]),

              //   );

              return GestureDetector(
                onTap: () {
                  debugPrint('onTap!');

                  _dialogBuilder(context);
                },
                onLongPress: () {
                  debugPrint('onLongPress!');

                  _dialogBuilder(context);
                },
                child: ProductBox(item: products[index]),
              );
            }));
  }
}

// import 'package:flutter/material.dart';

// import 'package:roll_dice_app/product_box.dart';

// class ProductHomePage extends StatelessWidget {

//   const ProductHomePage({super.key});

//   @override

//   Widget build(BuildContext context) {

//     return Scaffold(

//       appBar: AppBar(title: const Text('Product Listing!')),

//       body: ListView(

//         shrinkWrap: true,

//         children: const [

//                ProductBox(

//                   name: "iPhone",

//                   description: "iPhone is the stylist phone ever",

//                   price: 1000,

//                   image: "iphone.jpg"

//                ),

//                ProductBox(

//                   name: "Pixel",

//                   description: "Pixel is the most featureful phone ever",

//                   price: 800,

//                   image: "pixel.jpg"

//                ),

//                ProductBox(

//                   name: "Laptop",

//                   description: "Laptop is most productive development tool",

//                   price: 2000,

//                   image: "laptop.jpg"

//                ),

//                ProductBox(

//                   name: "Tablet",

//                   description: "Tablet is the most useful device ever for meeting",

//                   price: 1500,

//                   image: "tablet.jpg"

//                ),

//                ProductBox(

//                   name: "Pendrive",

//                   description: "Pendrive is useful storage medium",

//                   price: 100,

//                   image: "pendrive.jpg"

//                ),

//                ProductBox(

//                   name: "Floppy Drive",

//                   description: "Floppy drive is useful rescue storage medium",

//                   price: 20,

//                   image: "floppydisk.jpg"

//                ),

//             ],

//       )

//     );

//  }

// }
