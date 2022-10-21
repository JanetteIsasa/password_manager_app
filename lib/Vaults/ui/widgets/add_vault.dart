import 'package:elevenpass/Accounst_Page/ui/widgets/text_delete.dart';
import 'package:elevenpass/widgets/button_secondary.dart';
import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../Accounst_Page/ui/widgets/label_text.dart';
import '../../../widgets/app_colors.dart';


class AddVault extends StatelessWidget {
  const AddVault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> keyForm = GlobalKey();
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: const Text(
            'Add Vault',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                fontFamily: 'Montserrat'
            ),
            textAlign: TextAlign.center,
          ),

          actionsPadding: const EdgeInsets.symmetric(horizontal: 30),
          contentPadding:  const EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content:SizedBox(
            height: 350,
            width: 300,
            child: Column(
              children: [
                const Divider(
                  height: 30,
                  thickness: 1,
                  color: AppColors.inputIconColor,
                ),
                Form(
                  key: keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(height: 10,),
                      const LabelText(text: 'Name',),
                      vaultName(),
                      const LabelText(text: 'Icon',),
                      const SizedBox(height: 10,),
                      iconSelect(),
                      const SizedBox(height: 20,),
                      const LabelText(text: 'Description',),
                      const SizedBox(height: 10,),
                      description(),

                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ButtonPrimary(text: 'Add Vault', onPressed: () => Navigator.pop(context, 'Add Vault'), height: 50, width: double.infinity),
            const SizedBox(height: 10,),
            ButtonSecondary(text: 'Cancel', onPressed: () => Navigator.pop(context, 'Cancel'), height: 50, width: double.infinity),
            const SizedBox(height: 25,),
          ],

        ),
      ),
    );
  }
  Widget vaultName(){
    return TextFormField(
      keyboardType: TextInputType.name,
      style: const TextStyle(
          fontSize: 16, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w400),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: 'vault name',
        suffixIcon: Icon(
          Icons.account_balance_wallet,
          color: AppColors.inputIconColor,
        )
      ),
    );
  }

  Widget description(){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: AppColors.inputIconColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: "content’s description, (optional).",

        ),

      ),
    );
  }

  Widget iconSelect(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.inputIconColor,
            ),
            child: const Icon(
                Icons.folder_outlined,
              color: AppColors.primary,
            ),
          ),
        ),

        Container(
          height: 40,
          width: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: AppColors.inputIconColor,
              width: 1,
            ),
          ),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: "Choose icon",

            ),

          ),
        )


      ],
    );
  }
}
