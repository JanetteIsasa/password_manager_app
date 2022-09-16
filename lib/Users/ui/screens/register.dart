import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui' as ui;
import '../../../widgets/app_colors.dart';
import '../../../widgets/customs/custom2.dart';
import '../../../widgets/text_appBar.dart';
import '../../../widgets/arrow_button.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();



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
          leading: const ArrowButton(),
          title: TextAppBar("11Pass",),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              CustomPaint(
                size: Size(double.infinity, size.height * 0.25),
                painter: CustomPainter2(),
              ),
              Positioned(
                  top: 10,
                  child: Lottie.asset("assets/lottie/registration.json",
                      height: 200, repeat: false))
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Contiene el Texto central
                    SizedBox(
                        height: (size.height * 0.09),
                        child: const Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary),
                          ),
                        )),

                    //Contiene el formulario
                    Container(
                      child: Form(
                        key: keyForm,
                        child: formUI(),
                      ),
                    ),

                    //Text y Text Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Already have a account? ",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(200, 203, 206, 1),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                            onPressed: null,
                            child: Text(
                              'Login here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(56, 117, 211, 1),
                                fontSize: 16,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget formUI() {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: (size.height * 0.40),
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //Email
          TextFormField(
            controller: emailCtrl,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(30.0, 20.0, 0, 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter your email",
              suffixIcon: const IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  onPressed: null,
                  icon: Icon(
                    Icons.mail,
                    color: AppColors.inputIconColor,
                  )),
              fillColor: AppColors.inputBackground,
              filled: true,
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = RegExp(pattern);
              if (value?.length == 0) {
                return "Mail is necessary";
              } else if (!regExp.hasMatch(value!)) {
                return "Invalid email";
              } else {
                return null;
              }
            },
          ),
          //User
          TextFormField(
            controller: nameCtrl,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 0, 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide.none,
              ),
              hintText: "Enter your username",
              suffixIcon: const IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  onPressed: null,
                  icon: Icon(
                    Icons.person,
                    color: AppColors.inputIconColor,
                  )),
              fillColor: AppColors.inputBackground,
              filled: true,
            ),
            validator: (value) {
              String pattern = r'(^[a-zA-Z ]*$)';
              RegExp regExp = RegExp(pattern);
              if (value?.length == 0) {
                return "Name is required";
              } else if (!regExp.hasMatch(value!)) {
                return "The name must be a-z and A-Z";
              }
            },
          ),
          //Password
          TextFormField(
            keyboardType: TextInputType.text,
            controller: passwordCtrl,
            obscureText: !_obscureText,
            //maxLength: 20,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(30.0, 20.0, 0, 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Enter your password',
              // Here is key idea
              suffixIcon: IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.inputIconColor,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              fillColor: AppColors.inputBackground,
              filled: true,
            ),
            validator: (value) {
              String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&+=])(?=\\S+).{8,20}";
              RegExp regExp = RegExp(pattern);
              if (value!.length < 8) {
                return "Password too short.";
              } else if (!regExp.hasMatch(value!)) {
                return "The password must have at least 8 characters, uppercase, lowercase, special character, blank spaces are not allowed.";
              } else {
                return null;
              }

            }
          ),
          ButtonPrimary(
            text: "Sign Up",
            onPressed: () {
              save();
            },
            height: (size.height * 0.075),
            width: double.infinity,
          )
        ],
      ),
    );
  }

  save() {
    if (keyForm.currentState!.validate()) {
      //print("Nombre ${nameCtrl.text}");
      //print("Pas ${passwordCtrl.text}");
      //print("Correo ${emailCtrl.text}");

      setState(() {
        emailCtrl.text = "";
        nameCtrl.text = "";
        passwordCtrl.text = "";
      });
    }
  }
}
