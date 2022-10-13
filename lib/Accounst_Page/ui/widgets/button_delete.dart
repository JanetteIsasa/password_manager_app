import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
class ButtonDelete extends StatelessWidget {
  const ButtonDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextButton(
        onPressed: null,
        child: Text(
          'Delete Account',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
            color: AppColors.dangerColor,
          ),
          textAlign: TextAlign.left,
        )
    );
  }
}
