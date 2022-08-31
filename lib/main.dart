//import 'package:elevenpass/splashscreen.dart';
import 'package:elevenpass/welcome.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      //home: const SplashScreen(),
      home: Welcome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

