import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba1/apis/api_details_movie.dart';
import 'package:prueba1/apis/api_popular.dart';
import 'package:prueba1/model/popular_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMovieScreen extends StatefulWidget {
  const DetailMovieScreen({Key? key}) : super(key: key);

  @override
  State<DetailMovieScreen> createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  ApiPopular? apiPopular;
  ApiDetailsMovie apiDetailsMovie = ApiDetailsMovie();

  @override
  void initState() {
    apiPopular = ApiPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final popularModel =
        ModalRoute.of(context)!.settings.arguments as PopularModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text(
          'Detalles de Película',
          style: GoogleFonts.lato(
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
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * 0.6, // Ancho máximo para el título

                        child: Text(
                          popularModel.title ?? 'Título no disponible',
                          style: GoogleFonts.lato(
                            shadows: [
                              const Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
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
                              style: GoogleFonts.lato(
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FutureBuilder(
                      future: apiPopular!.getTrailerKey(popularModel.id as int),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                  ),
                ),
                //RELEASE DATE
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 5),
                      child: Text(
                        'Fecha de lanzamiento:',
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        popularModel.releaseDate ?? 'Fecha no disponible',
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                //GENEROS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Géneros',
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: FutureBuilder<List<String>?>(
                    future: apiDetailsMovie.getGenres(popularModel.id as int),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        List<String>? genres = snapshot.data;
                        if (genres != null && genres.isNotEmpty) {
                          return Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: genres.map((genre) {
                              return Chip(
                                label: Text(
                                  genre,
                                  style: GoogleFonts.lato(
                                    color: Colors.black,
                                  ),
                                ),
                                backgroundColor: Colors.white,
                                elevation: 4,
                                shadowColor: Colors.green.withOpacity(0.8),
                                padding: const EdgeInsets.all(5.0),
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                labelStyle: const TextStyle(fontSize: 13.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  side: BorderSide(
                                      color: Colors.green.shade900, width: 1.0),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return const Text(
                            'No se encontraron géneros para esta película.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        }
                      } else {
                        return const Text(
                          'No se encontraron géneros para esta película.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    textAlign: TextAlign.justify,
                    'Resumen: \n${popularModel.overview}',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                //GENEROS
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Actores',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
