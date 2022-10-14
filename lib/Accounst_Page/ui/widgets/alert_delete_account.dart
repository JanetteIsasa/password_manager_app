import 'package:elevenpass/Accounst_Page/ui/widgets/text_delete.dart';
import 'package:elevenpass/widgets/button_secondary.dart';
import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/app_colors.dart';

class AlertDeleteAccount extends StatelessWidget {
  const AlertDeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(horizontal: 30),
          contentPadding:  const EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Lottie.asset('assets/lottie/warning.json', repeat: false, height: 120),
                const Text(
                  'Are you sure that you want delete your account?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: AppColors.dangerColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15,),
              ],
            ),
          ),
          actions: <Widget>[
            ButtonSecondary(text: 'Delete', onPressed: () => Navigator.pop(context, 'Cancel'), height: 50, width: double.infinity),
            const SizedBox(height: 10,),
            ButtonPrimary(text: 'Cancel', onPressed: () => Navigator.pop(context, 'Cancel'), height: 50, width: double.infinity),
            const SizedBox(height: 15,),
          ],

        ),
      ),
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: const TextDelete(),
    );
  }
}
