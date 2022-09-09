
import 'package:flutter/cupertino.dart';

class CustomWelcome extends CustomPainter{

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