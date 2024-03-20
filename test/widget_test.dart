import 'package:flutter_test/flutter_test.dart';
import 'package:prueba1/apis/api_details_movie.dart';

void main() {
  test('Test de integración para obtener géneros de una película', () async {
    final api = ApiDetailsMovie();
    final int movieId = 1011985;
    final genres = await api.getGenres(movieId);

    if (genres != null) {
      print("Géneros de la película:");
      genres.forEach((genre) {
        print(genre);
      });
    } else {
      print("No se pudieron obtener los géneros de la película.");
    }
    expect(genres, isNotNull); // Verifica que los géneros no sean nulos
    expect(genres!.length,
        greaterThan(0)); // Verifica que se haya devuelto al menos un género
  });
}
