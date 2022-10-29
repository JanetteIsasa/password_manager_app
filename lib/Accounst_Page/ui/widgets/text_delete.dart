import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
class TextDelete extends StatelessWidget {
  const TextDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Delete Account',
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        fontFamily: 'Montserrat',
        color: AppColors.dangerColor,
      ),
      textAlign: TextAlign.left,
    );
  }
}
