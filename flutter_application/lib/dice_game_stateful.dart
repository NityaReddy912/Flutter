// import 'package:flutter/material.dart';
// class diceRoll extends StatefulWidget {
//   const diceRoll({super.key});
//   @override
//   State<diceRoll> createState() => _diceRoller();
// }

// class _diceRoller extends State<diceRoll> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(mainAxisSize: MainAxisSize.min, children: [
//         Image.asset(activeImage, width: 200),
//         const SizedBox(
//           height: 20,
//         ),
//         TextButton(
//           style: TextButton.styleFrom(
//             textStyle: const TextStyle(fontSize: 28.0),
//           ),
//           //6.1
//           //onPressed: () {},
//           //6.2
//           onPressed: rollDice,
//           child: const Text('Roll Dice'),
//         )
//       ]),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'dart:math';


// class Dice extends StatefulWidget {
// @override
// _DiceState createState() => _DiceState();
// }

// class _DiceState extends State<Dice> {
// int dice_no = 1;
// void update() {
// 	setState(() {
// 	//Random.nextInt(n) returns random integer from 0 to n-1
// 	dice_no = Random().nextInt(6) + 1;
// 	});
// }

// @override
// Widget build(BuildContext context) {
// 	return Center(
// 			child: Image.asset('assets/Images/$dice_no.png'),
// 			onPressed: () {
// 			update();
// 			},
// 		);
	
// }
// }


import 'dart:math';
import 'package:flutter/material.dart';
class DiceGame extends StatefulWidget {
  DiceGame({Key? key}) : super(key: key);
  @override
  State<DiceGame> createState() => _DiceGameState();
}
class _DiceGameState extends State<DiceGame> {
  //variable
  var activeImage = 'assets/Images/dice-1.png';
  // Event Listener for onPressed of TextButton
  void rollDice() {
    // This is not the way interactive widget gets handled, instead
    // we should maintain the state and modify the state of the widget
    Random random=Random();
    int num=random.nextInt(6)+1;
    setState(() {
          activeImage = 'assets/Images/dice-${num}.png';
    });
 
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

