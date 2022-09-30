import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/app_colors.dart';


class BodyFavorites extends StatelessWidget {
  const BodyFavorites ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: const Text(
            "You haven't add favorites yet",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'MontserratAlternates',
              fontSize: 24,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset("assets/lottie/empy-list-favorites.json",
            height: 200, repeat: false
        )
      ],
    );
  }
}


