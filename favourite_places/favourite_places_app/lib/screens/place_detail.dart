// import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        ),
        body: Stack(
          children:[
            Image.file(
            place.image,
            fit:BoxFit.cover,
            width:double.infinity,
            height:double.infinity,)
          ],)
    );
  }
}