import 'package:chat_app_initial/screens/auth.dart';
import 'package:chat_app_initial/screens/chat.dart';
import 'package:chat_app_initial/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//2.1

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  //2.1
   WidgetsFlutterBinding.ensureInitialized();
  
  //2.1
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      //4.1
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx,snapshot){
          if(snapshot.hasData){
            return const ChatScreen();
          }
          // 5.2 sometimes firebase takes time to authenticate the 
          // token so meanwhile we would like to show splash screen
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SplashScreen();
          }
          return const AuthScreen();
        })
      // //2.1
      // home : const AuthScreen(),
      //1.1
      //home: const Text('Chat App'),
    );
  }
}