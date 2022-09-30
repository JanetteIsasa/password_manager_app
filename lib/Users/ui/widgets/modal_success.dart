
import 'package:elevenpass/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../widgets/app_colors.dart';

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.7);

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

  //widget que se activa al presionar el botón

  Widget _buildOverlayContent(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          //contenedor del modal
          Container(
            height: (size.height * 0.45),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),

            //elementos dentro
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                //imagen de Lottie
                Lottie.asset("assets/lottie/success.json", height: 105, repeat: false),

                //Texto central y descripción
                Column(
                  children: const [
                    Text('Great!',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
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
                  ],
                ),

                //botón que le redirige al home
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Home())),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                      ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                  ),
                  child: SizedBox(
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Start Exploring'),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //la transición que va a realizar al activar
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

//clase que debemos llamar para usar en register()
class ModalSuccess extends StatelessWidget {
  const ModalSuccess({Key? key}) : super(key: key);

  void _showOverlay(BuildContext context) {
    Navigator.of(context).push(TutorialOverlay());
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => _showOverlay(context),
    );
  }
}