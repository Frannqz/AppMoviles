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
          'https://lh3.googleusercontent.com/proxy/yiK1VSbW8NNaUkQ85MmBJaTcfiSBGTCgeNYX2t3NbRQl3vvISWAmB_VgK6m4tx2yJbHGpX1i_jT9hD1K8BADe1X0rC1QKEBfJLZAh9D8n5L_MdgxNv9RgBic8PTGtXbo3DDK',
          height: 250),
      loadingIndicator: Image.asset('images/load.gif'),
      done: Done(const LoginScreen(),
          animationDuration: const Duration(milliseconds: 3000)),
    );
  }
}
