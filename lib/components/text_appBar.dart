import 'package:elevenpass/app_colors.dart';
import 'package:flutter/material.dart';

class TextAppBar extends StatelessWidget {
  final String title;

  TextAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 28.0),
    );
  }
}