import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.green[200],
        child: Column(
          children: [
            Container(
              width: 220,
              margin: const EdgeInsets.only(top: 35, bottom: 30),
              child: Image.asset("images/itcelaya.png"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: const Text(
                "Tecnológico Nacional de México en Celaya",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: const Text(
                "El Instituto Tecnológico de Celaya es una institución de educación superior localizada en la ciudad de Celaya, Gto. Es dependiente, al igual que varios institutos tecnológicos, orgánica y funcionalmente del Gobierno Federal.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
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
                  child: GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Antonio García Cubas 600, Fovissste, 38010 Celaya, Gto.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Aqui va el otro
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 60, top: 10, bottom: 135),
                  width: 55,
                  child: Lottie.network(
                    "https://lottie.host/549c8ce1-a475-4581-972d-e37daeb9e2d7/FqjWnhYMCN.json",
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 100),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Telefono:",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "461 611 7575",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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

  // Función para abrir otro enlace
  _launchAnotherURL() async {
    // Agrega el enlace que deseas abrir
  }
}
