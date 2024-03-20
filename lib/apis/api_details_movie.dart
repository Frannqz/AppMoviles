import 'package:dio/dio.dart';

class ApiDetailsMovie {
  final Dio dio = Dio();

  Future<List<String>?> getGenres(int movieId) async {
    final URL =
        "https://api.themoviedb.org/3/movie/$movieId?api_key=fc94b66bb0314813cf7af53dd2cba49d&language=es-MX";

    try {
      Response response = await dio.get(URL);
      if (response.statusCode == 200) {
        final List<dynamic> genres = response.data['genres'];
        List<String> genreNames =
            genres.map((genre) => genre['name'].toString()).toList();
        return genreNames;
      }
    } catch (e) {
      print("Error al obtener los géneros: $e");
    }
    return null;
  }
}
