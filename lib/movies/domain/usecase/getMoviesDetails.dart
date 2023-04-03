import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/baseUseCase/baseUseCase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';

class GetMoviesDetails extends BaseUseCase <MoviesDetails , MoviesDetailsParameters> {
  final DomainRepository domainRepository;

  GetMoviesDetails(this.domainRepository);

  @override
  Future<Either<Failure, MoviesDetails>> call(parameters) async {
    return await domainRepository.getMoviesDetails(parameters);
  }
}

class MoviesDetailsParameters extends Equatable {
  final int id;

  const MoviesDetailsParameters({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
