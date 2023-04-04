import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/getMoviesDetails.dart';
import 'package:movies_app/movies/domain/usecase/getRecommendation.dart';

abstract class DomainRepository{
  Future<Either<Failure , List<Movies>>> getNowPlaying();

  Future<Either<Failure , List<Movies>>> getPopular();

  Future<Either<Failure , List<Movies>>> getTopRated();

  Future<Either<Failure , MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters);

  Future<Either<Failure , List<Recommendation>>> getMoviesRecommendation(RecommendationParameters parameters);
}