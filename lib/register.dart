import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
import 'app_colors.dart';
import 'components/text_appBar.dart';
import 'customs/custom2.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: (size.height * 0.09),
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: InkResponse(
          child: Container(
            margin: const EdgeInsets.fromLTRB(8, 15,8,15),
            padding: const EdgeInsets.only(left: 10),
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(100), color: AppColors.menuBackground),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 24,
            ),
          ), onTap: (){
          Navigator.of(context).pop();
          },
        ),
        title: TextAppBar("11Pass"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(double.infinity, size.height * 0.25),
                  painter: RPSCustomPainter2(),
                ),
                Positioned(
                  top: -18,
                  child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_u8o7BL.json", height: 250),
                )
              ]
          ),

          Expanded(
              child: Column(
                children: [
                  Container(
                    height: (size.height * 0.09),

                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontFamily: "Monserrat",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary
                        ),

                      ),
                    )
                  ),

                ],
              )
          )
        ],
      )
    

    );
  }
}

