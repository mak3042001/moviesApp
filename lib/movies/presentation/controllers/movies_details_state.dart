part of 'movies_details_bloc.dart';

@immutable
class MoviesDetailsState extends Equatable {
  final MoviesDetails? moviesDetails;
  final RequestState requestState;
  final String message;
  final List<Recommendation> moviesRecommendation;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  const MoviesDetailsState({
    this.moviesDetails,
    this.requestState = RequestState.loading,
    this.message = "",
    this.moviesRecommendation = const [],
    this.recommendationRequestState = RequestState.loading,
    this.recommendationMessage = "",

  });

  MoviesDetailsState copyWith({
    MoviesDetails? moviesDetails,
    RequestState? requestState,
    String? message,
    List<Recommendation>? moviesRecommendation,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
}){
    return MoviesDetailsState(
      message: message ?? this.message,
      moviesDetails: moviesDetails ?? this.moviesDetails,
      requestState: requestState ?? this.requestState,
      moviesRecommendation: moviesRecommendation ?? this.moviesRecommendation,
      recommendationRequestState: recommendationRequestState ?? this.recommendationRequestState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
    moviesDetails,
    requestState,
    message,
    moviesRecommendation,
    recommendationRequestState,
    recommendationMessage,
  ];


}
