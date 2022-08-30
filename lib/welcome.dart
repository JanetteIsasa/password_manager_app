import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {

  Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            color: Colors.red,
          ),
          _buildBullets(),
          Container(
            width: double.infinity,
            height: 120,
            color: Colors.red,

          ),
        ],
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
            width: 8,
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
            ),
          ),
          Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
          ),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}


