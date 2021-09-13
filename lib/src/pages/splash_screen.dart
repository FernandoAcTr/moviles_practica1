import 'package:flutter/material.dart';
import 'package:practica2/src/pages/login_page.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginPage(),
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      duration: 3000,
      imageSize: 130,
      imageSrc: "assets/logo.png",
      text: "Splash Screen",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
