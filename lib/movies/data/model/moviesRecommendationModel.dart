import 'package:movies_app/movies/domain/entities/recommendation.dart';

class MoviesRecommendationModel extends Recommendation {
  const MoviesRecommendationModel({
    required super.id,
    super.backdropPath,
  });

  factory MoviesRecommendationModel.fromJson(Map<String, dynamic> json) {
    return MoviesRecommendationModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ?? "/fHWUxzEgCqIfToLjlY9UrR6uQtz.jpg",
    );
  }

}
