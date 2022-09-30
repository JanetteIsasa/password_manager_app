import 'package:elevenpass/Accounst_Page/ui/widgets/account_data.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';

class BodyAccount extends StatelessWidget {
  const BodyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: const EdgeInsets.only(left: 0, top: 60, right: 0, bottom: 10),
      //color: Colors.grey,
      child:  const AccountData(),
    );
  }
}
