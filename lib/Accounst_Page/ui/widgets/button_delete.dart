import 'package:elevenpass/Accounst_Page/ui/widgets/alert_delete_account.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
class ButtonDelete extends StatelessWidget {
  const ButtonDelete({Key? key}) : super(key: key);

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
