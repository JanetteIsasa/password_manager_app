import 'package:elevenpass/Accounst_Page/ui/widgets/button_delete.dart';
import 'package:elevenpass/Accounst_Page/ui/widgets/label_text.dart';
import 'package:elevenpass/Accounst_Page/ui/widgets/text_delete_description.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/arrow_button.dart';
import '../../../widgets/customs/custom_3.dart';
import '../../../widgets/text_app_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> keyForm = GlobalKey();
  // Initially password is obscure
  bool _obscureText = true;

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
              "Edit Profile",
            ),
            centerTitle: true,
            actions: const [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.check,
                    size: 30,
                    color: Colors.white,
                  )),
              SizedBox(
                width: 15,
              ),
            ]),
        body: Column(
          children: [
            Stack(
                alignment: Alignment.center, children: [
              CustomPaint(
                size: Size(double.infinity, size.height * 0.18),
                painter: CustomPainter3(),
              ),
              Positioned(
                  bottom: -15,
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.grey),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset('assets/images/imageUser.png',
                              fit: BoxFit.cover),
                        ),
                      ),
                      const TextButton(
                          onPressed: null,
                          child: Text(
                            'Upload Image',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                              color: AppColors.primary,
                            ),
                          )
                      ),
                    ],
                  ),)
            ]),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const SizedBox(height: 25,),
                          //Contiene el formulario
                          Form(
                            key: keyForm,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const LabelText(text: 'name user',),
                                inputUser(),
                                const LabelText(text: 'email',),
                                inputEmail(),
                                const SizedBox(height: 15,),
                                const Text(
                                  'Change password',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.primary,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 10,),
                                const LabelText(text: 'old password'),
                                inputPassword(),
                                const LabelText(text: 'new password'),
                                inputPassword(),
                                const LabelText(text: 'repeat new password'),
                                inputPassword(),
                              ],
                            ),
                          ),
                          const ButtonDelete(),
                          const TextDeleteDescription(text: "When the account is delete, it won't"),
                          const TextDeleteDescription(text: "be possible to recover your data."),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  Widget inputUser(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          fontSize: 16, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w400),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: 'user001@gmail.com',
        suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Icon(
              Icons.mail,
              color: AppColors.inputIconColor,
            )),
      ),
    );
  }
  Widget inputEmail(){
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
          fontSize: 16, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w400),
      decoration: const InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: 5.0,),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        hintText: 'user001@gmail.com',
        suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Icon(
              Icons.mail,
              color: AppColors.inputIconColor,
            )),
      ),
    );
  }
  Widget inputPassword(){
    return TextFormField(
        keyboardType: TextInputType.visiblePassword,
        //controller: passwordCtrl,
        obscureText: !_obscureText,
        style: const TextStyle(
            fontSize: 16, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w400),

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 5.0,),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: '************',
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
        ),
        validator: (value) {
          String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#%^&+=])(?=\\S+).{8,20}";
          RegExp regExp = RegExp(pattern);
          if (value!.length < 8) {
            return "Password too short.";
          } else if (!regExp.hasMatch(value)) {
            return "The password must have at least 8 characters, uppercase, lowercase, special character, blank spaces are not allowed.";
          } else {
            return null;
          }

        }
    );
  }


}


