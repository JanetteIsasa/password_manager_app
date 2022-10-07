
import 'package:flutter/cupertino.dart';

import '../app_colors.dart';
class CustomPainter3 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.0899429,size.height*0.5775333,size.width*0.3387429,size.height*0.5694667);
    path0.cubicTo(size.width*0.3499429,size.height*0.5686333,size.width*0.6548571,size.height*0.5669667,size.width*0.6944000,size.height*0.5661333);
    path0.quadraticBezierTo(size.width*0.9084571,size.height*0.5873000,size.width,size.height);
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


