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
    final trailerUrl =
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=fc94b66bb0314813cf7af53dd2cba49d";

    try {
      final response = await dio.get(trailerUrl);

      if (response.statusCode == 200) {
        final results = response.data['results'];
        if (results != null && results.isNotEmpty) {
          // Filtrar para encontrar el tráiler oficial
          final trailer = results.firstWhere(
              (video) => video['type'] == 'Trailer',
              orElse: () => null);
          if (trailer != null) {
            return trailer['key'];
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
