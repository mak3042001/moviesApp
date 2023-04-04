import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/requestState.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecase/getMoviesDetails.dart';
import 'package:movies_app/movies/domain/usecase/getRecommendation.dart';

part 'movies_details_event.dart';

part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {

  MoviesDetailsBloc(
    this.getMoviesDetails,
    this.getRecommendation,
  ) : super(const MoviesDetailsState()) {
    on<DetailsEvent>(_getMoviesDetails);
    on<RecommendationEvent>(_getMoviesRecommendation);
  }

  final GetMoviesDetails getMoviesDetails;
  final GetRecommendation getRecommendation;

  FutureOr<void> _getMoviesDetails(
      DetailsEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getMoviesDetails(MoviesDetailsParameters(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          requestState: RequestState.loaded,
          moviesDetails: r,
        ),
      ),
    );
  }

  FutureOr<void> _getMoviesRecommendation(
      RecommendationEvent event, Emitter<MoviesDetailsState> emit) async {
    final result =
        await getRecommendation(RecommendationParameters(id: event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationRequestState: RequestState.loaded,
          recommendationMessage: l.message,
        )
      ),
      (r) => emit(
        state.copyWith(
          moviesRecommendation: r,
          recommendationRequestState: RequestState.loaded,
        )
      ),
    );
  }
}
