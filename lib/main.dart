import 'package:elevenpass/Accounst_Page/ui/screens/edit_profile.dart';
import 'package:elevenpass/home.dart';
import 'package:elevenpass/welcome.dart';
import 'package:elevenpass/widgets/app_colors.dart';
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
        ),
        fontFamily: "Montserrat",
        backgroundColor: AppColors.primary,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

