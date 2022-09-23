import 'package:flutter/cupertino.dart';

import '../app_colors.dart';

class CustomPainterHome extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height*0.5361000);
    path0.quadraticBezierTo(size.width*0.9885000,size.height*0.7510500,size.width*0.7868000,size.height*0.7523000);
    path0.cubicTo(size.width*0.6611750,size.height*0.7523000,size.width*0.3731250,size.height*0.7475000,size.width*0.2475000,size.height*0.7475000);
    path0.quadraticBezierTo(size.width*0.0336250,size.height*0.7365750,0,size.height*0.9422000);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}












