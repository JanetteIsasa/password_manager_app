import 'package:flutter/material.dart';

class TextAppBar extends StatelessWidget {
  final String title;

  const TextAppBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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