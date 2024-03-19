import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba1/apis/api_popular.dart';
import 'package:prueba1/model/popular_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  ApiPopular? apiPopular;

  @override
  void initState() {
    apiPopular = ApiPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final popularModel =
        ModalRoute.of(context)!.settings.arguments as PopularModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text(
          'Detalles de Película',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
            ),
            onPressed: () {
              //Accion
            },
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo con efecto de desenfoque
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${popularModel.posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width *
                            0.6, // Ancho máximo para el título

                        child: Text(
                          popularModel.title ?? 'Título no disponible',
                          style: const TextStyle(
                            fontSize: 28,
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
                // AspectRatio(
                //   aspectRatio: 16 / 9, // Proporción del aspecto para la imagen
                //   child: FadeInImage(
                //     placeholder: const AssetImage('images/load.gif'),
                //     image: NetworkImage(
                //       'https://image.tmdb.org/t/p/w500/${popularModel.backdropPath}',
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),

                // Visualizador del tráiler
                FutureBuilder(
                  future: apiPopular!.getTrailerKey(popularModel.id as int),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (snapshot.hasData) {
                      YoutubePlayerController _controller =
                          YoutubePlayerController(
                        initialVideoId: snapshot.data!,
                        flags: const YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                        ),
                      );
                      return YoutubePlayer(
                        //Retorna el reproductor de youtube
                        controller: _controller,
                        showVideoProgressIndicator: false,
                        progressIndicatorColor: Colors.red,
                        progressColors: const ProgressBarColors(
                          playedColor: Colors.red,
                          handleColor: Colors.redAccent,
                        ),
                        bottomActions: [
                          ProgressBar(isExpanded: true),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Fallo la visualización del trailer",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    textAlign: TextAlign.justify,
                    'Resumen: \n${popularModel.overview}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
