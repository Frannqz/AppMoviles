import 'package:flutter/material.dart';
import 'package:prueba1/apis/api_popular.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final api = ApiPopular();
            final movieId = 763215;

            final trailerKey = await api.getTrailerKey(movieId);
            if (trailerKey != null) {
              print('Clave del tráiler: $trailerKey');
            } else {
              print('No se pudo obtener la clave del tráiler');
            }
          },
          child: Text('Obtener clave del tráiler'),
        ),
      ),
    );
  }
}
