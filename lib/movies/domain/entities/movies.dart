import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final String backdropPath;
  final String originalLanguage;
  final String title;
  final String overview;
  final String releaseDate;
  final List<int> genreIds;
  final int id;
  final double voteAverage;

  const Movies(
      {
      required this.backdropPath,
      required this.originalLanguage,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.genreIds,
      required this.id,
      required this.voteAverage,
      }
    );

  @override
  // TODO: implement props
  List<Object?> get props => [
    backdropPath,
    originalLanguage,
    title,
    overview,
    releaseDate,
    genreIds,
    id,
    voteAverage,
  ];

}
