import 'package:elevenpass/widgets/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonSecondary extends StatefulWidget {

  final String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;

  ButtonSecondary({Key? key, required this.text, required this.onPressed, required this.height, required this.width}) : super(key: key);

  @override
  State createState() {
    return _ButtonSecondary();
  }
}

class _ButtonSecondary extends State<ButtonSecondary>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),

        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20.0,
              fontFamily: "Montserrat",
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),

          ),
        ),

      ),
    );
  }
}