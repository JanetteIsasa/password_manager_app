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
        padding: EdgeInsets.all(25),
        width: double.infinity,
        height: 480,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "Hello",
                style: TextStyle(fontSize: 48.0, fontFamily: "Montserrat_Alternates", fontWeight: FontWeight.w600, color: Colors.white) ,
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
      color: AppColors.primary,
      height: 25,
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


    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.lineTo(0,0);
    path0.quadraticBezierTo(size.width*0.0445600,size.height*0.1358400,size.width*0.0891600,size.height*0.1554800);
    path0.quadraticBezierTo(size.width*0.1370800,size.height*0.1896800,size.width*0.2580000,size.height*0.1920000);
    path0.lineTo(size.width*0.6980000,size.height*0.1920000);
    path0.quadraticBezierTo(size.width*0.8000000,size.height*0.1950000,size.width*0.8340000,size.height*0.1960000);
    path0.cubicTo(size.width*0.9164000,size.height*0.1901600,size.width*0.9259600,size.height*0.2175600,size.width*0.9519400,size.height*0.2390800);
    path0.quadraticBezierTo(size.width*0.9862800,size.height*0.2696800,size.width,size.height*0.3398000);
    path0.lineTo(size.width,size.height*0.9973200);
    path0.lineTo(size.width*0.3913400,size.height);

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





