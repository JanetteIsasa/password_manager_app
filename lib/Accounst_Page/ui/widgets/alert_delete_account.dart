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

          content: Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Lottie.network('https://assets7.lottiefiles.com/packages/lf20_ij3k2doy.json', repeat: false, height: 120),
                SizedBox(height: 15,),
                const Text(
                  'Are you sure that you want delete your account?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                    color: AppColors.dangerColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ButtonSecondary(text: 'Cancel', onPressed: () => Navigator.pop(context, 'Cancel'), height: 50, width: double.infinity)
                ),
                const SizedBox(height: 10,),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                  child: ButtonPrimary(text: 'Cancel', onPressed: () => Navigator.pop(context, 'Cancel'), height: 50, width: double.infinity)
                ),

              ],
            )
          ],

        ),
      ),
      child: const TextDelete(),
    );
  }
}
