import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green[200],
        child: Column(children: [
          Container(
              width: 220,
              margin: const EdgeInsets.only(top: 60, bottom: 30),
              child: Image.asset("images/itcelaya.png")),
          Container(
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: const Text(
              "Tecnológico Nacional de México en Celaya",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: const Text(
              "El Instituto Tecnológico de Celaya es una institución de educación superior localizado en la ciudad de Celaya, Gto. Es dependiente, al igual que varios institutos tecnológicos, orgánica y funcionalmente del Gobierno Federal.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, top: 15),
                width: 100,
                child: Lottie.network(
                  "https://lottie.host/2940a4d8-a056-4994-96a9-ecd1bce02fac/x3o0tva0Zd.json",
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 90.0),
                  child: GestureDetector(
                    onTap: () {
                      _launchURL(); // Abre el enlace cuando se toca el texto
                    },
                    child: Text(
                      "Antonio García Cubas 600, Fovissste, 38010 Celaya, Gto.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }

  // Función para abrir enlace
  _launchURL() async {
    const url = 'https://maps.app.goo.gl/dZrYRq9YzTGzqzgN9';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }
}
