import 'package:movies_app/movies/data/model/genres.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel(
      {required super.genres,
      required super.title,
      required super.releaseDate,
      required super.runtime,
      required super.backdropPath,
      required super.overview,
      required super.id,
      required super.voteAverage});

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsModel(
      backdropPath: json["backdrop_path"],
      genres: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromJson(e))),
      title: json["title"],
      releaseDate: json["release_date"],
      runtime: json["runtime"],
      overview: json["overview"],
      id: json["id"],
      voteAverage: json["vote_average"].toDouble(),
    );
  }
}
