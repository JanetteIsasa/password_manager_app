import 'package:elevenpass/Accounst_Page/ui/widgets/label_text.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/arrow_button.dart';
import '../../../widgets/text_app_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  // Initially password is obscure
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(100), )
                ),
                child: Column(

                  children:  [
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
                    const SizedBox(height: 15,),
                    const LabelText(text: 'name user',),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          fontSize: 16, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
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
                    ),
                    const LabelText(text: 'email',),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          fontSize: 16, fontFamily: 'Montserrat', color: Colors.black, fontWeight: FontWeight.w400),
                      decoration: const InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
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
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 10),
                            child: Text(
                              'Change password',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: AppColors.primary,
                              ),
                              textAlign: TextAlign.left,
                            )
                        ),
                        Spacer(),
                      ],
                    ),
                    const LabelText(text: 'old password'),
                    inputPassword(),
                    const LabelText(text: 'new password'),
                    inputPassword(),
                    const LabelText(text: 'repeat new password'),
                    inputPassword(),

                    Row(
                      children: const [
                        Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: TextButton(
                                onPressed: null,
                                child: Text(
                                  'Delete Account',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat',
                                    color: AppColors.dangerColor,
                                  ),
                                )
                            ),
                        ),
                        Spacer(),
                      ],
                    ),
                    const LabelText(text: "When the account is delete,"),
                    const LabelText(text: " it won't be possible to recover your data.")
                  ],
                ),
              ),
            )
          ],
        )
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
          contentPadding:
          const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
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


