import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
import 'app_colors.dart';


class Welcome extends StatelessWidget {

  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              contentInfo(),
              buildBullets(),
              Expanded(child:
                Container(
                  width: double.infinity,

                  child: CustomPaint(
                    size: Size(double.infinity, size.height),
                    painter: RPSCustomPainter(),

                  ),


                )
              )
            ],

        ),


      ),


    );
  }


  Widget contentInfo(){
    return
      Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        width: double.infinity,
        height: 480,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "Hello",
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white) ,
            ),
            //Image.asset('assets/images/security.png', width: 200,),
            Lottie.asset("assets/lottie/cyber-security.json", height: 250),
            //Lottie.network("https://assets5.lottiefiles.com/packages/lf20_ndt8zfny.json"),
            const Text(
              "An Internet user has to remember, on average, a total of 10 passwords each day. One in three users are forced to write down their passwords so as not to forget them",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            )

          ],
        ),

    );
  }
  Widget buildBullets() {
    return Container(
      color: AppColors.inputIconColor,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.menuBackground,
            ),
          ),
          Container(
            width: 5,
            height: 5,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          ),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
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


    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(0.5 * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);

    path.close();

    canvas.drawPath(path, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


