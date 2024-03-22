import 'package:prueba1/apis/api_credits_movie.dart';
import 'package:prueba1/model/credits_movie_model.dart';

void main() async {
  ApiCreditsMovie apiCreditsMovie = ApiCreditsMovie();

  //int movieId = 1011985;
  int movieId = 872585;
  List<CastModel>? actors = await apiCreditsMovie.getActors(movieId);

  // Verificar si se obtuvieron los actores correctamente
  if (actors != null) {
    print('Se obtuvieron los actores:');
    for (var actor in actors) {
      print('Nombre: ${actor.name} \nPersonaje: ${actor.character}');
    }
  } else {
    print('No se pudieron obtener los actores.');
  }
}
