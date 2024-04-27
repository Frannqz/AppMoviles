import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prueba1/services/products_firebase.dart';

class ProductsFirebaseScreen extends StatefulWidget {
  const ProductsFirebaseScreen({super.key});

  @override
  State<ProductsFirebaseScreen> createState() => _ProductsFirebaseScreenState();
}

class _ProductsFirebaseScreenState extends State<ProductsFirebaseScreen> {
  final productsFirebase = ProductsFirebase();

  void _showModal(BuildContext context, [DocumentSnapshot? producto]) {
    showModal(context, producto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_business),
        onPressed: () => _showModal(context),
      ),
      appBar: AppBar(
        title: const Text("Productos de Firebase"),
      ),
      body: StreamBuilder(
        stream: productsFirebase.consultar(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final producto = snapshot.data!.docs[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        producto.get('nombre_producto'),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Cantidad: ' + producto.get('cantidad'),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Text(
                        'Fecha caducidad: ' + producto.get('fecha_caducidad'),
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Image.network(producto.get('imagen')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              showModal(context, producto);
                            },
                            icon: Icon(Icons.edit),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () {
                              productsFirebase.borrar(producto.id);
                            },
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            if (snapshot.hasError) {
              return const Text("Error al obtener datos");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }

  showModal(context, DocumentSnapshot? producto) {
    //Controladores
    final conNombre = TextEditingController();
    final conCantidad = TextEditingController();
    final conFecha = TextEditingController();

    if (producto != null) {
      conNombre.text = producto.get('nombre_producto');
      conCantidad.text = producto.get('cantidad');
      conFecha.text = producto.get('fecha_caducidad');
    }

    final txtNombre = TextFormField(
      keyboardType: TextInputType.text,
      controller: conNombre,
      decoration: const InputDecoration(
        labelText: 'Nombre',
        border: OutlineInputBorder(),
      ),
    );

    final txtCantidad = TextFormField(
      keyboardType: TextInputType.number,
      controller: conCantidad,
      decoration: const InputDecoration(
        labelText: 'Cantidad',
        border: OutlineInputBorder(),
      ),
    );

    final btnAgregar = ElevatedButton.icon(
      onPressed: () {
        if (producto == null) {
          // Insertar nuevo producto
          productsFirebase.insertar({
            'cantidad': conCantidad.text,
            'fecha_caducidad': conFecha.text,
            'imagen': 'https://pbs.twimg.com/media/D26_kexX0AIQcuU.jpg',
            'nombre_producto': conNombre.text,
          });
        } else {
          // Actualizar producto existente
          productsFirebase.actualizar({
            'cantidad': conCantidad.text,
            'fecha_caducidad': conFecha.text,
            'imagen': 'https://pbs.twimg.com/media/D26_kexX0AIQcuU.jpg',
            'nombre_producto': conNombre.text,
          }, producto.id);
        }
        Navigator.pop(context);
      },
      icon: const Icon(Icons.save),
      label:
          Text(producto == null ? 'Guardar producto' : 'Actualizar producto'),
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        backgroundColor: MaterialStatePropertyAll(Colors.black87),
      ),
    );

    final space = SizedBox(
      height: 15,
    );

    final txtFecha = TextFormField(
      controller: conFecha,
      keyboardType: TextInputType.none, //Ocultamos el teclado
      decoration: const InputDecoration(
          labelText: 'Fecha caducidad', border: OutlineInputBorder()),
      onTap: () async {
        //Siempre que lleve un await llevara un async
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(), //get today's date
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(
              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
          setState(() {
            conFecha.text =
                formattedDate; //set foratted date to TextField value.
          });
        } else {
          print("Date is not selected");
        }
      },
    );

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Producto',
                  style: TextStyle(fontSize: 28),
                ),
              ),
              txtNombre,
              space,
              txtCantidad,
              space,
              txtFecha,
              space,
              btnAgregar
            ],
          );
        });
  }
}
