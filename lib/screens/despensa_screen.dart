import 'package:flutter/material.dart';
import 'package:prueba1/database/products_database.dart';
import 'package:prueba1/model/products_model.dart';

class DespensaScreen extends StatefulWidget {
  const DespensaScreen({super.key});

  @override
  State<DespensaScreen> createState() => _DespensaScreenState();
}

class _DespensaScreenState extends State<DespensaScreen> {
  ProductsDatabase? productsDB; //Late o ? no es nulo

  @override
  void initState() {
    super.initState();
    productsDB = new ProductsDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi despensa : '),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.shop))],
      ),
      body: FutureBuilder(
        future: productsDB!.CONSULTAR(),
        builder: (context, AsyncSnapshot<List<ProductosModel>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Algo salio mal: ('),
            );
          } else {
            if (snapshot.hasData) {
              return Container();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }
}
