//20
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//20.1
// colorScheme - general recommended global theme related
// variable names start with k
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

//22.1 for dark theme
var kDarkColorScheme = ColorScheme.fromSeed(
  //22.3 optimising brightness for the color scheme in dark mode
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 211, 214, 218),
);
void main() {
//LOCK
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then ((fn){
    
  
  runApp(MaterialApp(
    //22.2
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
    ),
    // //20
    //  theme: ThemeData().copyWith(
    //     useMaterial3: true,
    //   //20.1
    //   scaffoldBackgroundColor: const Color.fromARGB(255, 206, 149, 216)),
    //20
    theme: ThemeData().copyWith(
      useMaterial3: true,
      //20.1
      // check buttons - cancel, save expense
      colorScheme: kColorScheme,
      //20.2 override appbar theme
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.onPrimaryContainer,
        foregroundColor: kColorScheme.primaryContainer,
      ),
      //20.3 override card theme
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      //20.3
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: kColorScheme.onPrimaryContainer,
        backgroundColor: kColorScheme.primaryContainer,
      )),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16),
          ),
    ),
    //22
    //themeMode: ThemeMode.system,// default
     themeMode: ThemeMode.light,
    //themeMode: ThemeMode.dark,

    home: const Expenses(),
  ));
});
}



// import 'package:expense_tracker_app/widgets/expenses.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp( MaterialApp(
//     // 9 
//     theme: ThemeData(useMaterial3: true),
//     //2
//     home:const Expenses(),
//     //1
//     // home: Text('Expense List'),
//   ));
// }
