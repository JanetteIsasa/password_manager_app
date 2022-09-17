import 'package:flutter/material.dart';

class TextAndTextButton extends StatefulWidget {

  final String titleText;
  final String titleTextButton;
  final VoidCallback onPressed;

  TextAndTextButton( this.titleText, this.onPressed, this.titleTextButton, );

  @override
  State<TextAndTextButton> createState() => _TextAndTextButtonState();
}

class _TextAndTextButtonState extends State<TextAndTextButton> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.titleText,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(200, 203, 206, 1),
          ),
          textAlign: TextAlign.center,
        ),
        TextButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.titleTextButton,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromRGBO(56, 117, 211, 1),
                fontSize: 16,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
              ),
            )),
      ],
    );
  }
}
