import 'package:flutter/material.dart';
import 'package:prueba1/screens/login_screen.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundColor: Colors.green[500],
      logo: Image.asset(
        'images/itcelaya.png',
        height: 250,
      ),
      // loadingIndicator: Image.asset(
      //   'images/load.gif',
      //   height: 100, // Reducir el tamaño del GIF
      //   width: 100,
      // ),
      done: Done(const LoginScreen(),
          animationDuration: const Duration(milliseconds: 1500)),
    );
  }
}
