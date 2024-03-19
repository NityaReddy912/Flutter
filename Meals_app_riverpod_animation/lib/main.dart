// 2 GridView
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:meals_app/data/dummy_data.dart';
// import 'package:meals_app/screens/categories.dart';
// import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 102, 73, 71),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  //  runApp(const App());

  runApp(const ProviderScope(child: App()));
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
       //9
      home:const TabsScreen(),
      // //6
      // home:const CategoriesScreen(),
      // //5
      // home:const MealsScreen(
      //   //meals: [],
      //   meals: dummyMeals,
      // ),
      // //2
      // home:const CategoriesScreen(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 102, 73, 71),
//   ),
//   textTheme: GoogleFonts.latoTextTheme(),
// );
// void main() {
//   runApp(const App());
// }
// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: theme,
//       //1
//       home:const Center(child: Text('Meals App!')),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// final theme = ThemeData(
//   useMaterial3: true,
//   colorScheme: ColorScheme.fromSeed(
//     brightness: Brightness.dark,
//     seedColor: const Color.fromARGB(255, 207, 233, 166),
//   ),
//   //textTheme: GoogleFonts.latoTextTheme(),
// );
// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: theme,
//       home: Scaffold(
//         body: CustomScrollView(slivers: [
//           const SliverAppBar(
//             actions: [
//               Icon(
//                 Icons.person,
//                 size: 40,
//               ),
//             ],
//             title: Text('SliverAppBar Demo'),
//             leading: Icon(Icons.menu),
//             backgroundColor: Colors.green,
//             expandedHeight: 100.0,
//             floating: true,
//             pinned: true,
//           ),
//           // SliverList(
//           //   delegate: SliverChildListDelegate(_buildList(20)),
//           // ),
//           SliverGrid(
//             delegate: SliverChildBuilderDelegate((BuildContext context, int index){
//               return Container(
//                 color: _randomPaint(index),
//                 height:150.0
//               );
//             }), 
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 4 ))
         
//         ]),
//       ),
//     );
//   }
//   List<Widget> _buildList(int count){
//     List<Widget> listItems = [];

//     for(int i=1;i<=count;i++){
//       listItems.add(Padding(padding: const EdgeInsets.all(16.0),
//       child:Text('Sliver Item ${i.toString()}',
//       style:const TextStyle(fontSize: 22),),
//       ),
//       );
//     }
//     return listItems;
//   }
//   Color _randomPaint(int index){
//     if(index % 3 == 0){
//       return Colors.orange;
//     }else if(index % 3 == 1){
//       return Colors.blue;
//     }
//     return Colors.red;
//   }
// }
