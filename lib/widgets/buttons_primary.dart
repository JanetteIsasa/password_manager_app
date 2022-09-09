import 'package:elevenpass/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {

  final String text;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;

  ButtonPrimary({Key? key, required this.text, required this.onPressed, required this.height, required this.width}) : super(key: key);

  @override
  State createState() {
    return _ButtonPrimary();
  }
}

class _ButtonPrimary extends State<ButtonPrimary>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: const EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.primary,
        ),

        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 20.0,
                fontFamily: "Monserrat",
                color: Colors.white,
                fontWeight: FontWeight.w600,
            ),

          ),
        ),

      ),
    );
  }
}