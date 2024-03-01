import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue[100],
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.lightBlue[50],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(35.0),
                bottomRight: Radius.circular(35.0),
              ),
            ),
            margin: const EdgeInsets.only(bottom: 25),
            child: Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.55,
                child: Image.asset("images/sistemas_logo.webp"),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "Ingeniería en Sistemas Computacionales",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alinear los widgets al inicio (a la izquierda)
              children: [
                Text(
                  "Perfil de ingreso",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20), // Espacio entre los dos textos
                Text(
                  "El y la estudiante al ingresar, deberá tener habilidades matemáticas y lógicas, capacidad de análisis y síntesis de información, habilidades de investigación, así como interés por la computación y la programación, disposición para trabajar en equipo y sentido de compromiso social.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alinear los widgets al inicio (a la izquierda)
              children: [
                Text(
                  "Residencias Profesionales",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20), // Espacio entre los dos textos
                Text(
                  "A partir del 80% de créditos podrá realizar residencias profesionales, en donde pondrá en práctica sus conocimientos adquiridos en organizaciones gubernamentales, privadas, así como en la industria de software.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
