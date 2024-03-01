import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[200],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Lottie.network(
                "https://lottie.host/972700a1-ed80-4f5d-8946-808f4de12f45/kZ4dgYMthV.json",
              ),
            ),
            const SizedBox(height: 10), // Espacio entre el texto y la animación
            const Text(
              "Infraestructura dentro la Ing. en Sistemas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
                height: 30), // Espacio entre el titulo y la descripción
            const Text(
              "Cuenta con laboratorios equipados con tecnología de primer nivel en el desarrollo de competencias de las asignaturas que conforman el plan de estudios.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
                height:
                    40), // Espacio entre la descripción y la lista de laboratorios
            const Text(
              "Laboratorios:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
                height:
                    5), // Espacio entre el título de la lista y los elementos de la lista
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Laboratorio de Sistemas Operativos",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "- Laboratorio de redes",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "- Laboratorio de arquitectura de computadoras",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "- Laboratorio de programación",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height:
                    30), // Espacio entre la lista de laboratorios y la nueva sección
            const Text(
              "Salones en edificio:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
                height:
                    5), // Espacio entre el título y los elementos de la nueva sección
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Planta Baja:",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "  - C1, C2, C3, C4, C5, C6",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Planta Alta:",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "  - C7, C8, C9, C10",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
