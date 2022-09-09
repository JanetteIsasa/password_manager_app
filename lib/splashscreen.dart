import 'package:elevenpass/widgets/app_colors.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text("11PASS",style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold), ),
      ),
    );
  }
}