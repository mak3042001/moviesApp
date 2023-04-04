part of 'movies_details_bloc.dart';

@immutable
abstract class MoviesDetailsEvent extends Equatable {

  const MoviesDetailsEvent();
}

class DetailsEvent extends MoviesDetailsEvent {
  final int id;

  const DetailsEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id
  ];
}

class RecommendationEvent extends MoviesDetailsEvent {
  final int id;

  const RecommendationEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [
    id
  ];
}
