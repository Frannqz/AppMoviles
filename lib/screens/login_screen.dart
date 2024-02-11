import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:prueba1/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  final txtUser = TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );

  final pwdUser = TextFormField(
    keyboardType: TextInputType.text,
    obscureText: true,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/login_bg.jpg'),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //BOX´S TEXTFORMFIELD
            Positioned(
              top: 260,
              child: Opacity(
                opacity: .5,
                //BACKGROUND TEXTFORMFIELD
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 165,
                  width: MediaQuery.of(context).size.width * .9,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      txtUser,
                      const SizedBox(
                        height: 20,
                      ),
                      pwdUser
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              //  LOGO
              top: 80,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'images/login_bg_logo.png',
                  fit: BoxFit.contain, // Ajuste de la imagen
                  height: 130, // Ajusta el tamaño de la imagen
                ),
              ),
            ),
            Positioned(
              //MENU SOCIAL NETWORK
              bottom: 60,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width * .8,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SignInButton(Buttons.Email, onPressed: () {
                      setState(() {
                        isLoading = !isLoading;
                      });
                      Future.delayed(new Duration(milliseconds: 5000), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new DashboardScreen(),
                          ),
                        );
                      });
                    }),
                    SignInButton(Buttons.Google, onPressed: () {}),
                    SignInButton(Buttons.Facebook, onPressed: () {}),
                    SignInButton(Buttons.GitHub, onPressed: () {}),
                  ],
                ),
              ),
            ),
            isLoading
                ? const Positioned(
                    top: 490,
                    child: CircularProgressIndicator(
                      color: Colors.black38,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
