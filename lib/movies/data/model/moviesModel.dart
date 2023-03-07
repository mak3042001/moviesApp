import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.backdropPath,
    required super.originalLanguage,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.genreIds,
    required super.id,
    required super.voteAverage,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
        id: json["id"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
