import 'package:elevenpass/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height*0.6665333);
    path0.quadraticBezierTo(size.width*0.0508000,size.height*0.8129000,size.width*0.1696000,size.height*0.8304000);
    path0.cubicTo(size.width*0.3383250,size.height*0.8303000,size.width*0.6517750,size.height*0.8301000,size.width*0.8125000,size.height*0.8300000);
    path0.quadraticBezierTo(size.width*0.9569750,size.height*0.8362333,size.width,size.height);
    path0.lineTo(size.width,0);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

