import 'package:dio/dio.dart';
import 'package:prueba1/model/popular_model.dart';

class ApiPopular {
  final dio = Dio();
  final URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=fc94b66bb0314813cf7af53dd2cba49d&language=es-MX";

  Future<List<PopularModel>?> getPopularMovie() async {
    Response response = await dio.get(URL);
    if (response.statusCode == 200) {
      // final listMoviesMap = jsonDecode(response.data)['results'];
      final listMoviesMap = response.data['results'];

      return listMoviesMap
          .map<PopularModel>((movie) => PopularModel.fromMap(movie))
          .toList();
    }
    return null;
  }

  Future<String?> getTrailerKey(int movieId) async {
    final trailerUrlEsMX =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=fc94b66bb0314813cf7af53dd2cba49d&language=es-MX";

    final trailerUrlEn =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=fc94b66bb0314813cf7af53dd2cba49d&language=en-US";

    try {
      // Consulta tráilers en español de México
      final responseEsMX = await dio.get(trailerUrlEsMX);
      if (responseEsMX.statusCode == 200) {
        final resultsEsMX = responseEsMX.data['results'];
        if (resultsEsMX != null && resultsEsMX.isNotEmpty) {
          // Filtra para encontrar el tráiler oficial
          final trailerEsMX = resultsEsMX.firstWhere(
            (video) => video['type'] == 'Trailer',
            orElse: () => null,
          );
          if (trailerEsMX != null) {
            return trailerEsMX['key'];
          }
        }
      }

      // Consulta tráilers en inglés si no se encuentran tráilers en español de México
      final responseEn = await dio.get(trailerUrlEn);
      if (responseEn.statusCode == 200) {
        final resultsEn = responseEn.data['results'];
        if (resultsEn != null && resultsEn.isNotEmpty) {
          final trailerEn = resultsEn.firstWhere(
            (video) => video['type'] == 'Trailer',
            orElse: () => null,
          );
          if (trailerEn != null) {
            return trailerEn['key'];
          }
        }
      }
      return null;
    } catch (e) {
      print("Error al obtener la clave del tráiler: $e");
      return null;
    }
  }
}
