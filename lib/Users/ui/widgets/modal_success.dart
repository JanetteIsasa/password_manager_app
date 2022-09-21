
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/app_colors.dart';

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  Null get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: (size.height * 0.50),
            width: double.infinity,
            margin: EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset("assets/lottie/success.json", height: 100, repeat: false),
                const Text('Great!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  
                ),
                const Text(
                  'Your account have been created successfully',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                   // color: AppColors.inputLabels,
                    color: Color.fromRGBO(0, 0, 0, 0.55)
                  ),
                  textAlign: TextAlign.center,
                ),

                ElevatedButton(
                  onPressed: () {
                    print("Button pressed");
                  },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(50),
                        ),
                    ),
                    ),
                  child: const Text(
                    "Start Exploring",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        fontFamily: 'Montserrat'
                    ),
                  ),

                ),
                const Text(
                  'This is a nice overlay',
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Dismiss'),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}



class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: RaisedButton(
            onPressed: () => _showOverlay(context),
            child: Container(
              child: Text('Button')

            ),
          ),
        ),
      ),
    );
  }
}