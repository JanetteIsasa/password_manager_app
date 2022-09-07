import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
import 'app_colors.dart';


class Welcome extends StatelessWidget {

  final buttonPageOn = Container(
    margin: EdgeInsets.only(right: 5.0, left: 5.0),
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
    ),
  );

  final buttonPageOf = Container(
    margin: EdgeInsets.only(right: 5.0, left: 5.0),
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.menuBackground,
    ),
  );

  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Expanded(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: PageView(
                    children: [
                      contentPage(),
                      contentPage2(),
                      contentPage3(),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: CustomPaint(
                    size: Size(double.infinity, size.height),
                    painter: RPSCustomPainter(),
                    child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: const Center(
                          child: TextButton(
                              onPressed: null,
                              child: Text(
                                  'Login In To Your Account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                  ),
                                )
                            ),
                          )

                    ),

                  ),

                ),
              ],
          ),
        ),
      ),

    );
  }

  Widget contentPage(){
    return
      Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "Hello!",
                style: TextStyle(
                    fontSize: 48.0,
                    fontFamily: 'MontserratAlternates',
                    fontWeight: FontWeight.w600,
                    color: Colors.white) ,
            ),
            //Image.asset('assets/images/security.png', width: 200,),
            Lottie.asset("assets/lottie/cyber-security.json", height: 250),
            const Text(
              "An Internet user has to remember, on average, a total of 10 passwords each day. One in three users are forced to write down their passwords so as not to forget them",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonPageOn,
                buttonPageOf,
                buttonPageOf
              ],
            )

          ],
        ),

    );
  }
  Widget contentPage2(){
    return
      Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              " Vaults ",
              style: TextStyle(
                  fontSize: 48.0,
                  fontFamily: 'MontserratAlternates',
                  fontWeight: FontWeight.w600,
                  color: Colors.white) ,
            ),
            //Image.asset('assets/images/security.png', width: 200,),
            Lottie.asset("assets/lottie/96833-login.json", height: 250),
            const Text(
              "With this app you can add all the accounts you want by carrying out an order through vaults, this way it will be much easier to access them.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonPageOf,
                buttonPageOn,
                buttonPageOf
              ],
            )
          ],
        ),
      );
  }
  Widget contentPage3(){
    return
      Container(
        padding: EdgeInsets.all(25),
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Password",
              style: TextStyle(
                  fontSize: 48.0,
                  fontFamily: 'MontserratAlternates',
                  fontWeight: FontWeight.w600,
                  color: Colors.white) ,
            ),
            Lottie.asset("assets/lottie/forgot-password.json", height: 180),
            const Text(
              "If you do not remember your password you can check it by entering your trunk and your account. You only have to remember a single password that is that of this application",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonPageOf,
                buttonPageOf,
                buttonPageOn,
              ],
            )
          ],
        ),
      );
  }

}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0,size.height*1.0017200);
    path0.lineTo(0,size.height*0.0017200);
    path0.quadraticBezierTo(size.width*0.0445600,size.height*0.1375600,size.width*0.0891600,size.height*0.1572000);
    path0.quadraticBezierTo(size.width*0.1370800,size.height*0.1914000,size.width*0.2580000,size.height*0.1937200);
    path0.lineTo(size.width*0.6980000,size.height*0.1937200);
    path0.quadraticBezierTo(size.width*0.7930000,size.height*0.1967200,size.width*0.8270000,size.height*0.1977200);
    path0.cubicTo(size.width*0.8701600,size.height*0.1964400,size.width*0.8970400,size.height*0.1971200,size.width*0.9149800,size.height*0.2054400);
    path0.quadraticBezierTo(size.width*1.0013200,size.height*0.2600400,size.width,size.height*0.3735200);
    path0.lineTo(size.width,size.height*0.9990400);
    path0.lineTo(size.width*0.3913400,size.height*1.0017200);

    canvas.drawPath(path0, paint0);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}






