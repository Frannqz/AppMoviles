import 'package:flutter/material.dart';
import 'package:prueba1/model/popular_model.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  @override
  Widget build(BuildContext context) {
    final popularModel =
        ModalRoute.of(context)!.settings.arguments as PopularModel;

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        // leading: const Icon(
        //   Icons.keyboard_return,
        //   color: Colors.white,
        // ),
        backgroundColor: Colors.black54,
        title: const Text(
          'Detalles de Pelicula',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width *
                        0.5, // Ancho máximo para el título

                    child: Text(
                      popularModel.title ?? 'Título no disponible',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.black,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          // popularModel.voteAverage.toString(),
                          popularModel.voteAverage!.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9, // Proporción del aspecto para la imagen
              child: FadeInImage(
                placeholder: const AssetImage('images/load.gif'),
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${popularModel.backdropPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Resumen: \n${popularModel.overview}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
