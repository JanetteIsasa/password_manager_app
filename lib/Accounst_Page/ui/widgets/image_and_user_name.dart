import 'package:flutter/material.dart';

class ImageUserName extends StatelessWidget {
  const ImageUserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0), color: Colors.grey),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.asset('assets/images/imageUser.png', fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 5,),
        const Text(
          'user001',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
              color: Color.fromRGBO(0, 0, 0, 0.82)
          ),
        )
      ],
    );
  }
}
