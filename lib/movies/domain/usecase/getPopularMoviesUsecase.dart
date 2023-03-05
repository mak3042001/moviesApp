import 'package:dartz/dartz.dart';
import 'package:movies_app/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';

class GetPopularMoviesUsecase{
  DomainRepository domainRepository;

  GetPopularMoviesUsecase(this.domainRepository);

  Future<Either<Failure , List<Movies>>> execute() async {
    return await domainRepository.getPopular();
  }
}