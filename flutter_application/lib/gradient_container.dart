import 'package:flutter/material.dart';

const startAlignment=Alignment.topLeft;
const endAlignment=Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key,required this.colors,required this.title});

  final List<Color> colors;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
            width:500,
            height:1000,
            decoration: BoxDecoration(
              gradient:LinearGradient(
              colors: colors,
              begin:startAlignment,
              end:endAlignment,
              )

            ),
          child:Center(
            child: Text(title, style: TextStyle(color:Color.fromRGBO(200, 243, 43, 0.729),
                                             fontSize:30.8,
                                             fontStyle: FontStyle.italic,
                                             fontWeight: FontWeight.bold )),
          ));
        
  }
}