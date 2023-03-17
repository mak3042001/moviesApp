import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/moviesRemoteDataSource.dart';
import 'package:movies_app/movies/data/repository/dataRepository.dart';
import 'package:movies_app/movies/domain/repository/domainRepository.dart';
import 'package:movies_app/movies/domain/usecase/getNowPlayingMoviesUsecase.dart';
import 'package:movies_app/movies/presentation/controllers/moviesBloc.dart';

final getIt = GetIt.instance;

class ServicesLocated{
  void init(){
    ///bloc
    getIt.registerFactory(() => MoviesBloc(getIt()));
    ///useCase
    getIt.registerLazySingleton(() => GetNowPlayingMoviesUsecase(getIt()));
    ///repository
    getIt.registerLazySingleton<DomainRepository>(() => DataRepository(getIt()));
    ///dataSource
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());
  }
}