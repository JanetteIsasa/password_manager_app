
import 'package:dio/dio.dart';
import 'package:elevenpass/Users/ui/screens/register.dart';
import 'package:elevenpass/Users/ui/widgets/modal_success.dart';
import 'package:elevenpass/widgets/buttons_primary.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  var resp = "";
  GlobalKey<FormState> keyForm = GlobalKey();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();




  // Initially password is obscure
  bool _obscureText = true;
  bool _validator = false;

  // Toggles the password show status

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
                  key: keyForm,
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
          AnimatedOpacity(
            opacity: _validator ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              height:(_validator==true) ?  30 : 0,
              child: Text(resp, style:
            const TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.dangerColor,
            ),),),
          ),
          //contiene los inputs
          inputUser(),
          const SizedBox(height: 10,),
          inputPassword(),
          const SizedBox(height: 60,),
          //Botón submit
          ButtonPrimary(
            text: "Login",
            onPressed: () {
              loginButton();
              _validator = true;
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


  //acción a realizar una vez oprimido el botón Sing Up
   loginButton() async {

    Response response;
    var dio = Dio();
    try {
      dio.options.contentType= Headers.formUrlEncodedContentType;
      response = await dio.post('http://10.0.2.2:8000/api/v1/auth/login',
        data: {'username': nameCtrl.text, 'password': passwordCtrl.text},
      );
      Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const Home()));
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response?.statusCode == 401) {
        print( e.response?.data["detail"]);
        return resp = e.response?.data["detail"] ;
      }else {
        print("server off");
        return resp = "Username and password is required";
      }


    }
  }



}