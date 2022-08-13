import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:prueba_tec_leal/ui/screens/login_screen.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedSplashScreen(
        nextScreen: LoginScreen(),
        splash: Image.asset('assets/images/background.jpg', scale: .2),
        animationDuration: const Duration(seconds: 4),
      );
}
