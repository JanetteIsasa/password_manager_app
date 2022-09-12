import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
import '../../../widgets/app_colors.dart';
import '../../../widgets/customs/custom2.dart';
import '../../../widgets/text_appBar.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController  nameCtrl = TextEditingController();
  TextEditingController  emailCtrl = TextEditingController();
  TextEditingController  passwordCtrl = TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          //toolbarHeight: (size.height * 0.09),
          backgroundColor: AppColors.primary,
          elevation: 0,
          leading: InkResponse(
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10,10,10),
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
                    painter: CustomPainter2(),
                  ),
                  Positioned(
                    top: -18,
                    child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_u8o7BL.json", height: 250),
                  )
                ]
            ),

            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Contiene el Texto central
                    Container(
                        height: (size.height * 0.09),
                        child: const Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary
                            ),

                          ),
                        )
                    ),
                    formUI(),
                    GestureDetector(
                        onTap: (){
                          save();
                        },
                        child:Container(
                          padding: EdgeInsets.fromLTRB(20,0, 20, 0),
                          child: ButtonPrimary(
                            text: "Sign Up",
                            onPressed: (){},
                            height: (size.height * 0.075),
                            width: double.infinity,
                          ),
                        )),

                    Container(
                      height: (size.height * 0.10),
                      padding: EdgeInsets.only(top: 10.0),
                      child: const Text(
                        "Already have a account? Login here",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Montserrat",
                          color: AppColors.inputLabels,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ],
                )
            )
          ],
        )


    );
  }

  Widget formUI() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      height: (size.height * 0.25),
      child: Column(
        children: <Widget>[
          Container(
            height: (size.height * 0.07),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppColors.inputBackground,
            ),
            child:  Center(
              child: TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  border: InputBorder.none ,
                  hintText: "Enter your username",
                  suffixIcon: Icon(Icons.person,color: AppColors.primary,),
                ),
                validator: (value) {
                  String pattern = r'(^[a-zA-Z ]*$)';
                  RegExp regExp = RegExp(pattern);
                  if (value?.length == 0) {
                    return "El nombre es necesario";
                  } else if (!regExp.hasMatch(value!)) {
                    return "El nombre debe de ser a-z y A-Z";
                  }
                },
              ),
            ),
          ),
          Container(
            height: (size.height * 0.07),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppColors.inputBackground,
            ),
            child:  Center(
              child: TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  border: InputBorder.none ,
                  hintText: "Enter your username",
                  suffixIcon: Icon(Icons.email,color: AppColors.primary,),
                ),
                keyboardType: TextInputType.emailAddress,
                maxLength: 32,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(pattern);
                  if (value?.length == 0) {
                    return "El correo es necesario";
                  } else if (!regExp.hasMatch(value!)) {
                    return "Correo invalido";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Container(
            height: (size.height * 0.07),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: AppColors.inputBackground,
            ),
            child:  Center(
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: passwordCtrl,
                obscureText: !_obscureText,//This will ob
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  // Here is key idea
                  suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _obscureText
                        ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.inputIconColor,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                  ),
                ),
                validator: (val) => val!.length < 6 ? 'Password too short.' : null,
              ),
            ),
          ),

        ],
      ),
    ) ;
  }

  save() {
    if (keyForm.currentState!.validate()) {
      print("Nombre ${nameCtrl.text}");
      print("PAs ${passwordCtrl.text}");
      print("Correo ${emailCtrl.text}");
      keyForm.currentState?.reset();
    }
  }

}
