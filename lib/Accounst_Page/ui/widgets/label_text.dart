import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: const TextStyle(
          color: AppColors.inputLabels,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      textAlign: TextAlign.left,
    );
  }
}
