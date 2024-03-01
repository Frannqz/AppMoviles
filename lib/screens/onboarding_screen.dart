import 'package:flutter/material.dart';
import 'package:prueba1/screens/Onboardings/IntroPage1.dart';
import 'package:prueba1/screens/Onboardings/IntroPage2.dart';
import 'package:prueba1/screens/Onboardings/IntroPage3.dart';
import 'package:prueba1/screens/dashboard_screen.dart';
import 'package:prueba1/screens/register_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //Controladores
  final PageController _sectionController = PageController();
  bool ultimaPagina = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _sectionController,
            onPageChanged: (index) {
              setState(() {
                ultimaPagina = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),

          //Indicadores de seccion
          Container(
              alignment: const Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Atras
                  GestureDetector(
                      onTap: () {
                        _sectionController.jumpToPage(2);
                      },
                      child: Text('Anterior')),
                  SmoothPageIndicator(controller: _sectionController, count: 3),
                  //Siguiente
                  ultimaPagina
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DashboardScreen();
                                },
                              ),
                            );
                          },
                          child: Text('Hecho'))
                      : GestureDetector(
                          onTap: () {
                            _sectionController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text('Siguiente'))
                ],
              )),
        ],
      ),
    );
  }
}
