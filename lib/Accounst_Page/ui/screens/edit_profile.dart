import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/arrow_button.dart';
import '../../../widgets/text_app_bar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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

                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  color: AppColors.inputLabels,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
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
                          // Here is key idea
                          suffixIcon: IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 30.0),
                              onPressed: null,
                              icon: Icon(
                                Icons.mail,
                                color: AppColors.inputIconColor,
                              )),
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ));
  }
}
