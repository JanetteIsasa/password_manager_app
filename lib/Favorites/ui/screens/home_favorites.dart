
import 'package:elevenpass/widgets/customs/custom_home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/arrow_button.dart';
import '../../../widgets/text_app_bar.dart';

class HomeFavorites extends StatelessWidget {
  const HomeFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: const ArrowButton(),
        title: const TextAppBar("11Pass",),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            CustomPaint(
              size: Size(double.infinity, size.height * 0.27),
              painter: CustomPainterHome(),

            ),
            Positioned(
              top: 25,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: 85,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.menuBackground,
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.inventory_2_outlined, size: 24,),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Vaults'),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(56, 117, 211, 0.95),
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.grade_outlined, size: 24,),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Favorites'),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        null;
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        elevation: 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.person_outline_outlined, size: 24,),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Account'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Expanded(
              child: Column(
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
                  Lottie.asset("assets/lottie/empy-list-favorites.json", height: 200)
                ],
              )
          )
        ],
      ),
    );
  }
}


