import 'package:flutter/material.dart';
import 'package:prueba1/screens/login_screen.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundColor: Colors.green[600],
      logo: Image.network(
          "https://sandstormit.com/wp-content/uploads/2021/06/incognito-2231825_960_720-1.png"),
      loadingIndicator: Image.asset('images/giphy.gif'),
      done: Done(const LoginScreen(),
          animationDuration: const Duration(milliseconds: 300)),
    );
  }
}
