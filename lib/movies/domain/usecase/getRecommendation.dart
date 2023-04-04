
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/baseUseCase/baseUseCase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';

class GetRecommendation extends BaseUseCase <List<Recommendation> , RecommendationParameters> {
  final DomainRepository domainRepository;

  GetRecommendation(this.domainRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
    return await domainRepository.getMoviesRecommendation(parameters);
  }

}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}