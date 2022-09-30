import 'package:elevenpass/Accounst_Page/ui/screens/body_account.dart';
import 'package:elevenpass/Favorites/ui/screens/body_favorites.dart';
import 'package:elevenpass/Vaults/ui/screens/body_vault.dart';
import 'package:elevenpass/widgets/customs/custom_home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/arrow_button.dart';
import '../../../widgets/text_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const List<Widget> homeBodies = [
    BodyVault(),
    BodyFavorites(),
    BodyAccount(),
  ];

  int index = 0;

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
        leadingWidth: 75,
        title: const TextAppBar(
          "11Pass",
        ),
        centerTitle: true,
        actions: (index == 2) ? const [
          IconButton(
              onPressed: null,
              icon: Icon(
                  Icons.logout,
                size: 30,
                color: Colors.white,
              )
          ),
          SizedBox(width: 15,),
        ] : null,
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            CustomPaint(
              size: Size(double.infinity, (index == 2) ? size.height * 0.35 : size.height * 0.27),
              painter: CustomPainterHome(),
            ),
            Positioned(
              top: 25,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.menuBackground,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (index == 0)
                            ? const Color.fromRGBO(56, 117, 211, 0.95)
                            : Colors.transparent,
                        elevation: (index == 0) ? null : 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.inventory_2_outlined,
                              size: 24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Vaults'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (index == 1)
                            ? const Color.fromRGBO(56, 117, 211, 0.95)
                            : Colors.transparent,
                        elevation: (index == 1) ? null : 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.grade_outlined,
                              size: 24,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Favorites'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (index == 2)
                            ? const Color.fromRGBO(56, 117, 211, 0.95)
                            : Colors.transparent,
                        elevation: (index == 2) ? null : 0,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      child: SizedBox(
                        width: 80,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.person_outline_outlined,
                              size: 24,
                            ),
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
            if (index == 2) Positioned( bottom: 10, child: imageUser())
          ]),
          Expanded(
            child: homeBodies[index],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: (index == 1)? null : FloatingActionButton(
            onPressed: null,
            backgroundColor: AppColors.dangerColor,
            child: Icon(
              (index == 0) ? Icons.add : Icons.edit,
              size: 30,
            )),
      ),
    );
  }
}

Widget imageUser(){
  return Container(
    width: 90,
    height: 90,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      color: Colors.grey
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(50.0),
      child: Image.asset('assets/images/imageUser.png', fit: BoxFit.cover),
    ),
  );
}
