// import 'package:flutter/material.dart';
// class dice_game  extends StatelessWidget {
//   const dice_game ({Key?key}):super(key:key);
//   const activeImage='assets/images/dice-4.png';
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Column(
//       mainAxisSize:MainAxisSize.min,
//     Children: [
//       Image.asset(activeImage,width:200),const SizedBox()
//     ],),);
//   }
// }

import 'package:flutter/material.dart';

class DiceGame extends StatelessWidget {
  DiceGame({Key? key}) : super(key: key);

  //variable

  var activeImage = 'assets/Images/dice-4.png';

  // Event Listener for onPressed of TextButton

  void rollDice() {
    // This is not the way interactive widget gets handled, instead
    // we should maintain the state and modify the state of the widget
    activeImage = 'assets/Images/dice-4.png';
    debugPrint('Changing the Image! $activeImage');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(activeImage, width: 200),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 28.0),
          ),
          //6.1
          //onPressed: () {},
          //6.2
          onPressed: rollDice,
          child: const Text('Roll Dice'),
        )
      ]),
    );
  }
}
