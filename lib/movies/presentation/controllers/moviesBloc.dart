import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/requestState.dart';
import 'package:movies_app/movies/domain/usecase/getNowPlayingMoviesUsecase.dart';
import 'package:movies_app/movies/presentation/controllers/moviesEvents.dart';
import 'package:movies_app/movies/presentation/controllers/moviesState.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesState>{
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase) : super(const MoviesState()) {
    on<GetNowPlayingEvents>((event, emit) async {
      final result = await getNowPlayingMoviesUsecase.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loading));
      result.fold((l) => emit(MoviesState(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      )), (r) => emit(MoviesState(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: r,
      )));
    });
  }
}