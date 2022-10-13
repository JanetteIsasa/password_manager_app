import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';

class TextDeleteDescription extends StatelessWidget {
  const TextDeleteDescription({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.inputLabels
      ),
      textAlign: TextAlign.left,);
  }
}
