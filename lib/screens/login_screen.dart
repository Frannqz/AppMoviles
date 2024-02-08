import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtUser = TextFormField(
    keyboardType: TextInputType.emailAddress,
  );

  final pdwUser = TextFormField(
    keyboardType: TextInputType.text,
    obscureText: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/login.png'))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('images/loginlogo.png'),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.black,
              height: 200,
              child: ListView(
                shrinkWrap: true,
                children: [txtUser, pdwUser],
              ),
            )
          ],
        ),
      ),
    );
  }
}
