import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/moviesRemoteDataSource.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';
import 'package:movies_app/movies/domain/usecase/getMoviesDetails.dart';

class DataRepository implements DomainRepository{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  DataRepository(this.baseMoviesRemoteDataSource);

  @override
  Future<Either<Failure , List<Movies>>> getNowPlaying() async {
    final result = await baseMoviesRemoteDataSource.getNowPlaying();
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.remoteErrorResponseModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopular() async {
    final result = await baseMoviesRemoteDataSource.getPopular();

    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.remoteErrorResponseModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRated() async {
    final result = await baseMoviesRemoteDataSource.getTopRated();

    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.remoteErrorResponseModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(MoviesDetailsParameters parameters) async {
    final result = await baseMoviesRemoteDataSource.getMoviesDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.remoteErrorResponseModel.statusMessage));
    }
  }

}