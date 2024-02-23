import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prueba1/model/custom_textfield.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Uint8List? _image;
  File? selectedIMage;

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
          child: Column(
            children: [
              //ImagePicker
              _image != null
                  ? CircleAvatar(
                      radius: 100, backgroundImage: MemoryImage(_image!))
                  : const CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/149/149071.png"),
                    ),
              Positioned(
                  bottom: -0,
                  left: 140,
                  child: IconButton(
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      icon: const Icon(Icons.add_a_photo))),
              CustomTextField(
                controller: nombreController,
                name: "Nombre Completo",
                prefixIcon: Icons.person_outline,
                inputType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
              ),
              CustomTextField(
                controller: emailController,
                name: "Email",
                prefixIcon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
              ),
              CustomTextField(
                controller: passwordController,
                name: "Contraseña",
                prefixIcon: Icons.lock_outline,
                inputType: TextInputType.text,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  // Lógica para manejar el evento del botón de registro
                },
                child: const Text(
                  'Registrar',
                  selectionColor: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.green[100],
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
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
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
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
