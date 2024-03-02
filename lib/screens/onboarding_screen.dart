import 'package:flutter/material.dart';
import 'package:prueba1/screens/Onboardings/IntroPage1.dart';
import 'package:prueba1/screens/Onboardings/IntroPage2.dart';
import 'package:prueba1/screens/Onboardings/IntroPage3.dart';
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
            alignment: const Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _btnOnboarding(
                  text: 'Anterior',
                  onTap: () {
                    _sectionController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                ),
                SmoothPageIndicator(controller: _sectionController, count: 3),
                ultimaPagina
                    ? _btnOnboarding(
                        text: 'Hecho',
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ),
                          );
                        },
                      )
                    : _btnOnboarding(
                        text: 'Siguiente',
                        onTap: () {
                          _sectionController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//Botones de navegacion del onboarding
  _btnOnboarding({required String text, required Function() onTap}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.black45,
      ),
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
