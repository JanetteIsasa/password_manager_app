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
              )
          ),
          SizedBox(
            width: 15,
          ),
        ]
      ),
      body: Container(
        color: Colors.white,
        
      )
    );
  }
}
