import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';

class BodyAccount extends StatelessWidget {
  const BodyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      padding: EdgeInsets.only(left: 0, top: 60, right: 0, bottom: 10),
      //color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Email',
              style: TextStyle(
                  color: AppColors.inputLabels,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.left,
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Text(
              'usuario1@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.left,
            ),
          ),

          SizedBox(height: 30,),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Password',
              style: TextStyle(
                  color: AppColors.inputLabels,
                  fontSize: 18,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child:Text(
              'usuario1@Email.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.left,
            ),
          ),

        ],
      ),
    );
  }
}
