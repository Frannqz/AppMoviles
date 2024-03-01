import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[200],
      child: Align(
        alignment: Alignment.topCenter, // Alinear hacia arriba en el centro
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0), // Agregar un espacio superior
          child: Lottie.network(
            "https://lottie.host/972700a1-ed80-4f5d-8946-808f4de12f45/kZ4dgYMthV.json",
          ),
        ),
      ),
    );
  }
}
