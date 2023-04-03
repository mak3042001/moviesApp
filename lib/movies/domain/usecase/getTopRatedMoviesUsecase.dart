import 'package:dartz/dartz.dart';
import 'package:movies_app/core/baseUseCase/baseUseCase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';

class GetTopRatedMoviesUsecase extends BaseUseCase<List<Movies> , NoParameters>{
  DomainRepository domainRepository;

  GetTopRatedMoviesUsecase(this.domainRepository);

  @override
  Future<Either<Failure , List<Movies>>> call(NoParameters parameters) async {
    return await domainRepository.getTopRated();
  }
}