import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';

class AccountData extends StatefulWidget {
  const AccountData({Key? key}) : super(key: key);

  @override
  State<AccountData> createState() => _AccountDataState();
}

class _AccountDataState extends State<AccountData> {
  GlobalKey<FormState> keyForm = GlobalKey();

  // Initially password is obscure
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Column(
        children: [
          //Email
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

          const SizedBox(height: 15),

          //Password
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Password',
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
            keyboardType: TextInputType.text,
            obscureText: !_obscureText,
            style: const TextStyle(
                fontSize: 16, fontFamily: 'Montserrat', color: Colors.black),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Aa123&mmm',
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
          )
        ],
      ),
    );
  }
}
