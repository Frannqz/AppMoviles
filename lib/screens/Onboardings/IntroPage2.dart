import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
// import 'package:photo_view/photo_view.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key});

  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 14, fontWeight: FontWeight.bold);
  static const contentStyle =
      TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12);
  static const ciencia =
      '''https://celaya.tecnm.mx/wp-content/uploads/2024/01/Reticula_Rev2022_CienciaDeDatos.pdf''';
  static const industria =
      '''https://celaya.tecnm.mx/wp-content/uploads/2024/01/Reticula_Rev2022_Industria40.pdf''';
  static const cienciaImage = 'images/cienciaDatos.jpg';
  static const industriaImage = 'images/industria40.jpg';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.blue[100],
        child: Column(
          children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reticulas de la especialidad",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: Accordion(
                headerBackgroundColor: Colors.green[900],
                headerBorderColor: Colors.blueGrey,
                headerBorderColorOpened: Colors.transparent,
                headerBackgroundColorOpened: Colors.blue,
                contentBackgroundColor: Colors.white,
                contentBorderColor: Colors.blue,
                contentBorderWidth: 3,
                contentHorizontalPadding: 20,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                paddingListHorizontal: 30.0,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                sectionClosingHapticFeedback: SectionHapticFeedback.light,
                children: [
                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.code_rounded, color: Colors.white),
                    header: const Text('Industria 4.0', style: headerStyle),
                    content: Image.asset(
                      industriaImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    contentVerticalPadding: 20,
                    leftIcon: const Icon(Icons.data_array_rounded,
                        color: Colors.white),
                    header: const Text('Ciencia de Datos', style: headerStyle),
                    content: Image.asset(
                      cienciaImage,
                      fit: BoxFit.cover,
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
