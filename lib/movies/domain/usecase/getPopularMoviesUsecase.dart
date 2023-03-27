import 'package:dartz/dartz.dart';
import 'package:movies_app/core/baseUseCase/baseUseCase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';

class GetPopularMoviesUsecase extends BaseUseCase{
  DomainRepository domainRepository;

  GetPopularMoviesUsecase(this.domainRepository);

  @override
  Future<Either<Failure , List<Movies>>> call() async {
    return await domainRepository.getPopular();
  }
}