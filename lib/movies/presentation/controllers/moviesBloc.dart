import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/requestState.dart';
import 'package:movies_app/movies/domain/usecase/getNowPlayingMoviesUsecase.dart';
import 'package:movies_app/movies/domain/usecase/getPopularMoviesUsecase.dart';
import 'package:movies_app/movies/domain/usecase/getTopRatedMoviesUsecase.dart';
import 'package:movies_app/movies/presentation/controllers/moviesEvents.dart';
import 'package:movies_app/movies/presentation/controllers/moviesState.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesState()) {
    on<GetNowPlayingEvents>(_getNowPlayingMovies);
    on<GetPopularEvents>(_getPopularMovies);
    on<GetTopRatedEvents>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingEvents event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUsecase();
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded,
              nowPlayingMovies: r,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularEvents event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase();
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularState: RequestState.loaded,
              popularMovies: r,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedEvents event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase();
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedState: RequestState.loaded,
              topRatedMovies: r,
            )));
  }
}
