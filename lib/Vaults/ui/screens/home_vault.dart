
import 'package:flutter/material.dart';

import '../../../widgets/app_colors.dart';
import '../../../widgets/arrow_button.dart';
import '../../../widgets/customs/custom2.dart';
import '../../../widgets/text_app_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: const ArrowButton(),
        title: const TextAppBar("11Pass",),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(alignment: Alignment.center, children: [
            CustomPaint(
              size: Size(double.infinity, size.height * 0.25),
              painter: CustomPainter2(),
            ),
          ]),
        ],
      ),
    );
  }
}
