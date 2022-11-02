
import 'package:dio/dio.dart';
import 'package:elevenpass/Users/ui/screens/register.dart';
import 'package:elevenpass/Users/ui/widgets/modal_success.dart';
import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../api_client.dart';
import '../../../home.dart';
import '../../../widgets/app_colors.dart';
import '../../../widgets/customs/custom2.dart';
import '../../../widgets/text_app_bar.dart';
import '../../../widgets/arrow_button.dart';
import '../widgets/text_and_tbutton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  // Initially password is obscure
  bool _obscureText = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      dynamic res = await _apiClient.login(
        nameCtrl.text,
        passwordCtrl.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['access_token'] != null) {
        String accessToken = res['access_token'];
        print(accessToken);
        Navigator.push(context, MaterialPageRoute(
                builder: (context) => Home(accesstoken: accessToken)));
      }else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Error: username or password invalid',
            style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Montserrat'),
          textAlign: TextAlign.center,),
          backgroundColor: Colors.red.shade300,
        ));

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

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
                  top: 15,
                  child: Lottie.asset("assets/lottie/login.json",
                      height: 220, repeat: false))
            ]),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: formUI(),
                ),
              ),
            ),
          ],
        ));
  }

  //contiene la estructura del formulario
  Widget formUI() {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      height: (size.height * 0.50),
      child: Column(

        children: <Widget>[

          const SizedBox(height: 60,),
          //contiene los inputs
          inputUser(),
          const SizedBox(height: 10,),
          inputPassword(),
          const SizedBox(height: 60,),
          //Botón submit
          ButtonPrimary(
            text: "Login",
            onPressed: () {
              login();
            },
            height: (size.height * 0.075),
            width: double.infinity,
          ),

          //Text y Text Button
          TextAndTextButton("Don’t have account?", () =>
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Register())), 'SignUp here',),


        ],
      ),
    );
  }

  //input personalizados
  Widget inputPassword() {
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
        hintText: 'Password',
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

    );
  }

  Widget inputUser() {
    return TextFormField(
      controller: nameCtrl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(30.0, 20.0, 0, 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        hintText: "Username or email",
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

    );
  }

  }
