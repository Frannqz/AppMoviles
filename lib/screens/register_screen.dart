import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba1/model/custom_textfield.dart';
import 'package:prueba1/screens/onboarding_screen.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Uint8List? _image;
  File? selectedImage;

  final _formKey = GlobalKey<FormState>(); // Clave del formulario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Usuario"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //ImagePicker
                _image != null
                    ? CircleAvatar(
                        radius: 60, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("images/user.png"),
                      ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  child: IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      icon: const Icon(Icons.add_a_photo)),
                ),
                CustomTextField(
                  controller: nombreController,
                  name: "Nombre Completo",
                  prefixIcon: Icons.person_outline,
                  inputType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu nombre completo';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: emailController,
                  name: "Email",
                  prefixIcon: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Por favor, introduce un email válido';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: passwordController,
                  name: "Contraseña",
                  prefixIcon: Icons.lock_outline,
                  inputType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, introduce tu contraseña';
                    }
                    return null;
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Todos los campos son válidos, puedes continuar
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardingScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: const Text(
                        'Registrar',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30.0),
                  height: 230,
                  width: MediaQuery.of(context).size.width * .85,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SignInButton(Buttons.Email, onPressed: () {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        Future.delayed(new Duration(milliseconds: 5000), () {
                          /* Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => new DashboardScreen(),)
                          );*/
                          Navigator.pushNamed(context, "/dash").then((value) {
                            //si paso parametros el values los trae
                            setState(() {
                              isLoading = !isLoading;
                            });
                          });
                        });
                      }),
                      SignInButton(Buttons.Google, onPressed: () {}),
                      SignInButton(Buttons.Facebook, onPressed: () {}),
                      SignInButton(Buttons.GitHub, onPressed: () {}),
                    ],
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
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.green[200],
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 8.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.image,
                            size: 70,
                          ),
                          Text("Galeria")
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 70,
                          ),
                          Text("Camara")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

  //Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
