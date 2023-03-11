import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/requestState.dart';
import 'package:movies_app/movies/data/datasource/moviesRemoteDataSource.dart';
import 'package:movies_app/movies/data/repository/dataRepository.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';
import 'package:movies_app/movies/domain/usecase/getNowPlayingMoviesUsecase.dart';
import 'package:movies_app/movies/presentation/controllers/moviesEvents.dart';
import 'package:movies_app/movies/presentation/controllers/moviesState.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesState>{
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlayingEvents>((event, emit) async {
      BaseMoviesRemoteDataSource baseMoviesRemoteDataSource = MoviesRemoteDataSource();
      DomainRepository domainRepository = DataRepository(baseMoviesRemoteDataSource);
      final result = await GetNowPlayingMoviesUsecase(domainRepository).execute();
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