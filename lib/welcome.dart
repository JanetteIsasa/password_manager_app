import 'package:flutter/material.dart';


import 'app_colors.dart';


class Welcome extends StatelessWidget {

  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              contentInfo(),
              buildBullets(),
              CustomPaint(
                size: Size(double.infinity,(100*0.5833333333333334).toDouble()),
                painter: RPSCustomPainter(),
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
        height: 485,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "Hello",
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white) ,
            ),
            Image.asset('assets/images/security.png', width: 200,),
            //Lottie.asset("assets/lottie/security-pay.json"),
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

  Widget contentBut(){
    return Container(
        width: double.infinity,
        height: 130,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(80),

            )
        ),
        alignment: Alignment.center,
        child: const Text(
            "Login In To Your Account ",
            style: TextStyle(
            fontSize: 20,
          ),
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
    path0.moveTo(size.width*0.3333333,size.height*0.3571429);
    path0.quadraticBezierTo(size.width*0.3327083,size.height*0.4632143,size.width*0.3325000,size.height*0.4985714);
    path0.lineTo(size.width*0.5433333,size.height*0.5000000);
    path0.lineTo(size.width*0.5416667,size.height*0.3557143);
    path0.quadraticBezierTo(size.width*0.5245833,size.height*0.3235714,size.width*0.5141667,size.height*0.3200000);
    path0.quadraticBezierTo(size.width*0.5031250,size.height*0.3017857,size.width*0.4716667,size.height*0.3028571);
    path0.lineTo(size.width*0.4050000,size.height*0.3014286);
    path0.quadraticBezierTo(size.width*0.3706250,size.height*0.3003571,size.width*0.3583333,size.height*0.2857143);
    path0.quadraticBezierTo(size.width*0.3433333,size.height*0.2782143,size.width*0.3325000,size.height*0.2471429);
    path0.quadraticBezierTo(size.width*0.3327083,size.height*0.2746429,size.width*0.3333333,size.height*0.3571429);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


