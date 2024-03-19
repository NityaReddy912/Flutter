//2
import 'package:flutter/material.dart';
import 'package:update/demo_buttons.dart';

class UiUpdatesDemo extends StatefulWidget {
  const UiUpdatesDemo({super.key});

  @override
  StatefulElement createElement() {
    debugPrint('UiUpdatesDemo createElement called!');
    return super.createElement();
  }

  @override
  State<UiUpdatesDemo> createState() => _UiUpdatesDemoState();
}

class _UiUpdatesDemoState extends State<UiUpdatesDemo> {
 
  @override
  Widget build(BuildContext context) {
    debugPrint('UiUpdatesDemo build called!');
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Do you understand how Flutter updates UIs?',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          DemoButtons(),
        ],
      )),
    );
  }
}

// import 'package:flutter/material.dart';

// class UiUpdatesDemo extends StatefulWidget {
//   const UiUpdatesDemo({super.key});

//   @override
//   StatefulElement createElement() {
//     debugPrint('UiUpdatesDemo createElement called!');
//     return super.createElement();
//   }
//   @override
//   State<UiUpdatesDemo> createState() => _UiUpdatesDemoState();
// }

// class _UiUpdatesDemoState extends State<UiUpdatesDemo> {

//   var _isUnderstood = false;

//   @override
//   Widget build(BuildContext context) {
//      debugPrint('UiUpdatesDemo build called!');
//     return Center(
//       child:Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text('Every Flutter developer should have a basic understanding of Flutter\'s internals!',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontWeight: FontWeight.bold),),
//           const SizedBox(height: 16,),
//           const Text('Do you understand how Flutter updates UIs?',
//           textAlign: TextAlign.center,),
//           const SizedBox(height: 16,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextButton(
//                 onPressed: (){
//                   setState(() {
//                     _isUnderstood = false;
//                   });
//                 },
//                 child: const Text('No'),),
//                 TextButton(
//                 onPressed: (){
//                   setState(() {
//                     _isUnderstood = true;
//                   });
//                 },
//                 child: const Text('Yes'),),
//             ],
//           ),
//           if(_isUnderstood) 
//           const Text('Awesome!',style: TextStyle(fontSize: 30, color:Colors.red),)
//         ],)
//     );
//   }
// }