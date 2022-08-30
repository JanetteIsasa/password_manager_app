import 'package:flutter/material.dart';
import 'package:elevenpass/app_colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container()
            ),
            _buildBullets()
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
            ),
          ), Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red,
            ),
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
