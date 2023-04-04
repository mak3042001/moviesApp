import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MoviesDetails extends Equatable {
  final List<Genres> genres;
  final String backdropPath;
  final String releaseDate;
  final String overview;
  final String title;
  final int id;
  final int runtime;
  final double voteAverage;

  const MoviesDetails({
    required this.genres,
    required this.title,
    required this.releaseDate,
    required this.runtime,
    required this.backdropPath,
    required this.overview,
    required this.id,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
    backdropPath,
    overview,
    id,
    voteAverage,
    releaseDate,
    runtime,
    title,
    genres,
  ];
}
