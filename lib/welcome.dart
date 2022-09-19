import 'package:elevenpass/widgets/customs/custom_welcome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Users/ui/screens/register.dart';
import 'widgets/app_colors.dart';

class Welcome extends StatelessWidget {
  //botones encendidos
  final buttonPageOn = Container(
    margin: const EdgeInsets.only(right: 5.0, left: 5.0),
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
    ),
  );

  //botones apagados
  final buttonPageOf = Container(
    margin: const EdgeInsets.only(right: 5.0, left: 5.0),
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.menuBackground,
    ),
  );

  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Expanded(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PageView(
                  children: [
                    contentPage(),
                    contentPage2(),
                    contentPage3(),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 140,
                child: CustomPaint(
                  size: Size(double.infinity, size.height),
                  painter: CustomWelcome(),
                  child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const Register())),
                            child: const Text(
                              'Login In To Your Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.primary,
                              ),
                            )),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget contentPage() {
    const title = Text(
      "Hello!",
      style: TextStyle(
          fontSize: 48.0,
          fontFamily: 'MontserratAlternates',
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
    const descripcionText = Text(
      "An Internet user has to remember, on average, a total of 10 passwords each day. One in three users are forced to write down their passwords so as not to forget them",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );

    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 60,
            child: Center(
              child: title,
            ),
          ),
          Lottie.asset("assets/lottie/security-pay.json", height: 210),
          descripcionText,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buttonPageOn, buttonPageOf, buttonPageOf],
          )
        ],
      ),
    );
  }

  Widget contentPage2() {
    const title = Text(
      "Vaults",
      style: TextStyle(
          fontSize: 48.0,
          fontFamily: 'MontserratAlternates',
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
    const descripcionText = Text(
      "With this app you can add all the accounts you want by carrying out an order through vaults, this way it will be much easier to access them.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 60,
            child: Center(
              child: title,
            ),
          ),
          Lottie.asset("assets/lottie/96833-login.json", height: 210),
          descripcionText,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buttonPageOf, buttonPageOn, buttonPageOf],
          )
        ],
      ),
    );
  }

  Widget contentPage3() {
    const title = Text(
      "Password",
      style: TextStyle(
          fontSize: 48.0,
          fontFamily: 'MontserratAlternates',
          fontWeight: FontWeight.w600,
          color: Colors.white),
    );
    const descripcionText = Text(
      "If you do not remember your password you can check it by entering your trunk and your account.",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
    return Expanded(child:
    Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 60,
            child: Center(
              child: title,
            ),
          ),
          Lottie.asset("assets/lottie/data-security.json", height: 200),
          descripcionText,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonPageOf, buttonPageOf, buttonPageOn,
            ],
          )
        ],
      ),
    ));
  }
}
