import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:prueba1/model/popular_model.dart';

class AppiPopular {
  final dio = Dio();
  final URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=ff24b7bbb0fc4a4369dcb8cd87fa1f48&language=es-MX&page=1";

  Future<List<PopularModel>?> getPopularMovie() async {
    Response response = await dio.get(URL);
    if (response.statusCode == 200) {
      final listMoviesMap = jsonDecode(response.data)['results'];
      listMoviesMap.map((movie) => PopularModel.fromMap(movie)).toList();
    }
    return null;
  }
}
