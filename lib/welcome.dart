import 'package:flutter/material.dart';


import 'app_colors.dart';


class Welcome extends StatelessWidget {

  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              contentInfo(),
              buildBullets(),
              contentBut(),
            ],
        ),
      ),


    );
  }

  Widget contentInfo(){
    return
      Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        width: double.infinity,
        height: 400,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
                "Hello",
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white) ,
            ),
            Image.asset('assets/images/security.png', width: 200,),
            //Lottie.asset("assets/lottie/security-pay.json"),
            const Text(
              "An Internet user has to remember, on average, a total of 10 passwords each day. One in three users are forced to write down their passwords so as not to forget them",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            )

          ],
        ),

    );
  }
  Widget buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.menuBackground,
            ),
          ),
          Container(
            width: 5,
            height: 5,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          ),
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget contentBut(){
    return Center(
      child: Container(
        width: double.infinity,
        height: 150,
        color: Colors.white,

        child: const Text(
          "Login In To Your Account ",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      )


    );
  }
}


