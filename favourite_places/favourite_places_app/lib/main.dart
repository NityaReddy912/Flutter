// 2 GridView
// import 'package:favourite_places_app/screens/newItem.dart';
import 'package:favourite_places_app/screens/places.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  runApp(const ProviderScope(child: App()));
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
       //9
      home:const PlacesScreen(),
      // home:const NewItem(),
    );
  }
}
