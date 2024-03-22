import 'package:dio/dio.dart';
import 'package:prueba1/model/credits_movie_model.dart';

class ApiCreditsMovie {
  final Dio dio = Dio();

  Future<List<CastModel>?> getActors(int movieId) async {
    final String url =
        'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=fc94b66bb0314813cf7af53dd2cba49d&language=es-MX';

    try {
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> castList = response.data['cast'];
        // Filtrar los actores que tienen known_for_department como "Acting"
        List<CastModel> actors = castList
            .where((actor) => actor['known_for_department'] == 'Acting')
            .map((actor) => CastModel.fromMap(actor))
            .toList();

        return actors;
      } else {
        throw Exception('Fallo la carga de actores');
      }
    } catch (e) {
      print('Error fetching actors: $e');
      return null;
    }
  }
}
