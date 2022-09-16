import 'package:flutter/material.dart';

import 'app_colors.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      child: Container(
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.menuBackground),
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 24,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
