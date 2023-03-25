import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/requestState.dart';
import 'package:movies_app/movies/domain/usecase/getNowPlayingMoviesUsecase.dart';
import 'package:movies_app/movies/domain/usecase/getPopularMoviesUsecase.dart';
import 'package:movies_app/movies/domain/usecase/getTopRatedMoviesUsecase.dart';
import 'package:movies_app/movies/presentation/controllers/moviesEvents.dart';
import 'package:movies_app/movies/presentation/controllers/moviesState.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesState>{
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMoviesUsecase, this.getTopRatedMoviesUsecase) : super(const MoviesState()) {
    on<GetNowPlayingEvents>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      result.fold((l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      )), (r) => emit(state.copyWith(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: r,
      )));
    });
    on<GetPopularEvents>((event, emit) async {
      final result = await getPopularMoviesUsecase.execute();
      result.fold((l) => emit(state.copyWith(
        popularState: RequestState.error,
        popularMessage: l.message,
      )), (r) => emit(state.copyWith(
        popularState: RequestState.loaded,
        popularMovies: r,
      )));
    });
    on<GetTopRatedEvents>((event, emit) async {
      final result = await getTopRatedMoviesUsecase.execute();
      result.fold((l) => emit(state.copyWith(
        topRatedState: RequestState.error,
        topRatedMessage: l.message,
      )), (r) => emit(state.copyWith(
        topRatedState: RequestState.loaded,
        topRatedMovies: r,
      )));
    });
  }
}