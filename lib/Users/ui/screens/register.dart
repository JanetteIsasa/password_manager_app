// ignore_for_file: prefer_is_empty

import 'package:dio/dio.dart';
import 'package:elevenpass/Users/ui/screens/login.dart';
import 'package:elevenpass/Users/ui/widgets/modal_success.dart';
import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../widgets/app_colors.dart';
import '../../../widgets/customs/custom2.dart';
import '../../../widgets/text_app_bar.dart';
import '../../../widgets/arrow_button.dart';
import '../widgets/text_and_tbutton.dart';

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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.primary,
          elevation: 0,
          leading: const ArrowButton(),
          leadingWidth: 75,
          title: const TextAppBar(
            "11Pass",
          ),
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
                      height: 220, repeat: false))
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Contiene el Texto central
                    Container(
                        margin: EdgeInsets.symmetric(vertical:  size.height * 0.03),
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
                    Form(
                      key: keyForm,
                      child: formUI(),
                    ),

                   ],
                ),
              ),
            ),
          ],
        ));
  }

  //contiene la estructura del formulario
  Widget formUI() {

    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: (size.height * 0.50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //contiene los inputs
          inputEmail(),
          inputUser(),
          inputPassword(),

          //Botón submit
          ButtonPrimary(
            text: "Sign Up",
            onPressed: () {
              save();
            },
            height: (size.height * 0.075),
            width: double.infinity,
          ),

          //Text y Text Button
          TextAndTextButton("Already have a account? ", () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const Login())), 'Login here', ),
        ],
      ),
    );
  }

  //input personalizados
 Widget inputPassword(){
    return TextFormField(
        keyboardType: TextInputType.text,
        controller: passwordCtrl,
        obscureText: !_obscureText,
        //maxLength: 20,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(30.0, 20.0, 0, 20.0),
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
          String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&+=])(?=\\S+).{12,64}";
          RegExp regExp = RegExp(pattern);
     
          if (value!.length < 12) {
            return "Password too short.";
          } else if (!regExp.hasMatch(value)) {
            return "The password must have at least 8 characters, uppercase, lowercase, special character, blank spaces are not allowed.";
          } else {
            return null;
          }
        }
    );
 }
 Widget inputUser(){
    return TextFormField(
      controller: nameCtrl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(30.0, 20.0, 0, 20.0),
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
        return null;
      },
    );
 }
 Widget inputEmail(){
    return TextFormField(
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
        String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regExp = RegExp(pattern);
        if (value?.length == 0) {
          return "Mail is necessary";
        } else if (!regExp.hasMatch(value!)) {
          return "Invalid email";
        } else {
          return null;
        }
      },
    );
 }

 //acción a realizar una vez oprimido el botón Sing Up
  save() async {

    void _showOverlay(BuildContext context) {
      Navigator.of(context).push(TutorialOverlay());
    }

    if (keyForm.currentState!.validate()) {
      setState(() {
        emailCtrl.text = "";
        nameCtrl.text = "";
        passwordCtrl.text = "";
        _showOverlay(context);
        const ModalSuccess();
      });
    }
  }

}
