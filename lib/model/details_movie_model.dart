class DetailsMovieModel {
  final int id;
  final String name;

  DetailsMovieModel({
    required this.id,
    required this.name,
  });

  factory DetailsMovieModel.fromMap(Map<String, dynamic> movie) {
    return DetailsMovieModel(
      id: movie['id'],
      name: movie['name'],
    );
  }
}
