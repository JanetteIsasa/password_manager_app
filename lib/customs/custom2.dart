import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(19, 84, 185, 1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,size.height*0.0021333);
    path0.lineTo(0,size.height*0.5800000);
    path0.quadraticBezierTo(size.width*0.0267250,size.height*0.6843000,size.width*0.1231000,size.height*0.7446667);
    path0.quadraticBezierTo(size.width*0.1669000,size.height*0.7653667,size.width*0.3191000,size.height*0.7613333);
    path0.lineTo(size.width*0.6739000,size.height*0.7620000);
    path0.quadraticBezierTo(size.width*0.8031250,size.height*0.7610000,size.width*0.8734000,size.height*0.7628000);
    path0.cubicTo(size.width*0.9750500,size.height*0.7768667,size.width*0.9911500,size.height*0.8898000,size.width,size.height*0.9300000);
    path0.quadraticBezierTo(size.width*1.0080000,size.height*0.9188333,size.width,0);
    path0.lineTo(0,size.height*0.0021333);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
