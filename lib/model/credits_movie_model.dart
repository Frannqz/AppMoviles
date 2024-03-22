class CastModel {
  final String? knownForDepartment;
  final String? name;
  final String? profilePath;
  final String? character;

  CastModel({
    required this.knownForDepartment,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory CastModel.fromMap(Map<String, dynamic> actor) {
    return CastModel(
      knownForDepartment: actor['known_for_department'],
      name: actor['name'],
      profilePath: actor['profile_path'],
      character: actor['character'],
    );
  }
}
