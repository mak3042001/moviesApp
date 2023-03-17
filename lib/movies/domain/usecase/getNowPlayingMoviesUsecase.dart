import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';

class GetNowPlayingMoviesUsecase{
  DomainRepository domainRepository;

  GetNowPlayingMoviesUsecase(this.domainRepository);

  Future<Either<Failure , List<Movies>>> execute() async {
    return await domainRepository.getNowPlaying();
  }
}