import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/app_colors.dart';

class BodyVault extends StatelessWidget {
  const BodyVault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 200,
          left: 30,
          child: Column(
            children: const [
              Text('mm...', style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'MontserratAlternates',
                fontSize: 24,
                color: AppColors.primary,
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'It seems like there are no vaults yet.',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'MontserratAlternates',
                    fontSize: 24,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            right: -30,

            child: Container(
              child: Lottie.asset("assets/lottie/empty-list.json",
                  height: 200
              ),
            )
        )
      ],
    );
  }
}
