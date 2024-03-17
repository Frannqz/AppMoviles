import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Clase para registrarnos y autenticarnos
class EmailAuthFirebase {
  final auth = FirebaseAuth.instance;

//Dar de alta en firebase
  Future<bool> signUpUser(
      {required String name,
      required String password,
      required String email,
      required BuildContext context}) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        userCredential.user!
            .sendEmailVerification(); //Se envia el email para que verfique y se almacene en firebase
        return true;
      }
      return false;
    } catch (e) {
      print("Error al registrar usuario: $e");
      String errorMessage = e.toString();
      if (e is FirebaseAuthException) {
        //Si no es exepcion de Firebase lanza error generico
        errorMessage = e.message ?? "Hubo un error al registrar el usuario.";
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content:
                Text('Hubo un error al registrar el usuario: \n$errorMessage'),
            actions: <Widget>[
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }
  }

  Future<bool> signInUser(
      {required String password, required String email}) async {
    var flag = false;
    final userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (userCredential.user != null) {
      if (userCredential.user!.emailVerified) {
        flag = true;
      }
    }
    return flag;
  }
}
